var graficoModel = require("../models/graficoModel");

function buscarPontuacao(req, res) {

    // var qtdPontos = req.params.qtdPontos;

    console.log(`Recuperando as pontuações dos jogadores`);

    graficoModel.buscarPontuacao().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhuma pontuação encontrada!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os pontos.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarPontuacao

}