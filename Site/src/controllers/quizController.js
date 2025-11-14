var quizModel = require("../models/quizModel");

function listarPontos(req, res) {

  quizModel.listarPontos().then((resultadoListarPontos) => {
    if (resultadoListarPontos.length > 0) {
      res.status(200).json(resultadoListarPontos);
    } else {
        res.status(204).send("Nenhum resultado encontrado!")
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os pontos: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function cadastrarPontos(req, res) {
  var pontos = req.body.pontos;
  var idUsuario = req.body.idUsuario;

  if (pontos == undefined) {
    res.status(400).send("pontos está undefined!");
  } else if (idUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  } else {
    quizModel.cadastrarPontos(pontos, idUsuario)
      .then((resultado) => {
        res.status(201).json(resultado);
      })
      .catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro dos pontos! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  listarPontos,
  cadastrarPontos
};
