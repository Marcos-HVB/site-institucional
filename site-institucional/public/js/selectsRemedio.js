remedios = [
    {
        nome: "Talidomida",
        fkRemedio: 1
    },
    {
        nome: "Mesilato de Imatinibe",
        fkRemedio: 2
    },
    {
        nome: "Dasatinibe",
        fkRemedio: 3
    },
    {
        nome: "Rituximabe",
        fkRemedio: 4
    },
    {
        nome: "Trastuzumabe",
        fkRemedio: 5
    },
    {
        nome: "Nilotinibe",
        fkRemedio: 6
    },
    {
        nome: "Pertuzumabe",
        fkRemedio: 7
    },
    {
        nome: "Zidovudina",
        fkRemedio: 8
    }
]

var conteudoSelect = `<select name="" id="sel_remedio">
                    <option value="" disabled selected>REMÉDIO</option>`


remedios.forEach(remedio => {

    conteudoSelect += `<option value="${remedio.fkRemedio}"> ${remedio.nome}</option>`

});

selectRemedio.innerHTML = `${conteudoSelect} </select>`