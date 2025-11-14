var express = require("express");
var router = express.Router();

var graficoController = require("../controllers/graficoController");

router.get("/buscarPontuacao", function (req, res) {
    graficoController.buscarPontuacao(req, res);
});


module.exports = router;