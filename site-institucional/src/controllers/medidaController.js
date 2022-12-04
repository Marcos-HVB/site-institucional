var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 7;

    var idMedida = req.params.idMedida;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(idMedida, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var idMedida = req.params.idMedida;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idMedida).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}



function listar(req, res) {

    var fkUnidade = req.params.fkUnidade;
    console.log('Entrei no controller, fkUnidade: '+fkUnidade)

    medidaModel.listar(fkUnidade)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}


function cadastrarSensor(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nomeSensor = req.body.nomeSensorServer;
    var fkUnidade = req.body.fkUnidadeServer;
    var fkSetor = req.body.fkSetorServer;


    // Faça as validações dos valores
    if (nomeSensor == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (fkUnidade == undefined) {
        res.status(400).send("Sua fkUnidade está undefined!");
    } else if (fkSetor == undefined) {
        res.status(400).send("Sua fkSetor está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        medidaModel.cadastrarSensor(nomeSensor, fkUnidade, fkSetor)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    cadastrarSensor,
    listar
}