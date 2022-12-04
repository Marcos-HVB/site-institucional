var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idMedida", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/listar/:fkUnidade", function (req, res) {
    medidaController.listar(req, res);
    
});


router.post("/cadastrarSensor", function (req, res) {
    medidaController.cadastrarSensor(req, res);
})

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;