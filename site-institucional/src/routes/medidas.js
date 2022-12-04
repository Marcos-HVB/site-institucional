var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/listar/:fkUsuario", function (req, res) {
    medidaController.listar(req, res);
});


router.post("/cadastrarsensor", function (req, res) {
    usuarioController.cadastrarsensor(req, res);
})

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;