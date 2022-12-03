empresas = ['Bayer', 'Brainfarma', 'Eurofarma', 'Medley Indústria Farmacêutica']

unidades = [
    {
        empresa: 'Bayer',
        unidade: 'Unidade Matriz Tatuape',
        fkUnidade: 1
    },
    {
        empresa: 'Bayer',
        unidade: 'Unidade Mogi',
        fkUnidade: 2
    },
    {
        empresa: 'Brainfarma',
        unidade: 'Unidade Matriz Paulista',
        fkUnidade: 3
    },
    {
        empresa: 'Brainfarma',
        unidade: 'Unidade Sé',
        fkUnidade: 4
    },
    {
        empresa: 'Brainfarma',
        unidade: 'Unidade São Matheus',
        fkUnidade: 5
    },
    {
        empresa: 'Eurofarma',
        unidade: 'Unidade Matriz Tatuape',
        fkUnidade: 6
    },
    {
        empresa: 'Medley Indústria Farmacêutica',
        unidade: 'Unidade Matriz Eng.Goulart',
        fkUnidade: 8
    }
]


var conteudo =`<select id="sel_empresa" onchange="montarSelectUnidades()">
                            <option selected disabled value="">EMPRESA</option> `


empresas.forEach(empresa => {
    conteudo += `<option value="${empresa}"> ${empresa}</option>`
});

selectEmpresa.innerHTML += `${conteudo} </select>`


function montarSelectUnidades(){
    var empresaEscolhida = sel_empresa.value

    var conteudoUnidade = `<select id="sel_unidade">
                        <option selected disabled value="">UNIDADE</option> `
    
    unidades.forEach(unidade => {

        if(unidade.empresa == empresaEscolhida)
        conteudoUnidade += `<option value="${unidade.fkUnidade}"> ${unidade.unidade}</option>`

    });

    selectUnidade.innerHTML = `${conteudoUnidade} </select>`
}




