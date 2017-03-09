const style = `style = "text-align:center; margin-top: 15px; font-size:1.2rem;"`;
const eventMesseges = {
    ARQUIVA_CONFIRM: `<p ${style}>Tem certeza que deseja aqruivar? Todos os instrumentos jurídicos e conexões relacionadas também serão arquivadas!</p>`
};


function handleInstituicoesEvents(){

    $('.link-delete.instituicao').on("click",'i',function(event){
        event.preventDefault();
        let link = $(this);
        bootbox.confirm({
            message: eventMesseges.ARQUIVA_CONFIRM,
            size: "large",
            callback: function(sim){
                if(sim){
                    let clickable = link.next().click();
                    return true;
                } else{
                    bootbox.hideAll();
                    return false;
                }
            }
        }
        );
    });
}

function formCustomization(){
    /* geral */
    $('.chosen-select').chosen({
        width: '130px',
        allow_single_deselect: true
    });

    /* editar */
    $('.edit_instituicao input').prop("disabled", true);
    $('.edit_instituicao textarea').prop("disabled", true);
    // é necessario dar trigger nesse evento para rerenderizar a combo box com a nova config do select
    $('.edit_instituicao select').prop("disabled", true).trigger("chosen:updated");


    $('a.editar-form').on('click', function(e){
        e.preventDefault();
        $('.edit_instituicao input').prop("disabled", false);
        $('.edit_instituicao textarea').prop("disabled", false);
        $('.edit_instituicao select').prop("disabled", false).trigger("chosen:updated");
    });
}

function formValidadeInstituicao(){
    let options = {
        rules: {
            "instituicao[nome]":{
                required: true,
                minlength: 2
            }
        },

        messages: {
            "instituicao[nome]":{
                required: "Nome é obrigatório",
                minlength: "Nome precisa conter no mínimo 2 caracteres"
            }
        }
    };
    // let nome_rules = {
    //     required: true,
    //     minlength: 2,
    //     messages: {
    //         required: "Nome é obrigatório",
    //         minlength:  "Nome precisa conter no mínimo 2 caracteres"
    //     }
    // }
    //
    $("#new_instituicao").validate(options);

    // $("#instituicao_nome").rules("add",nome_rules);
}


$( document ).on('turbolinks:load', function() {
    handleInstituicoesEvents();
    formCustomization();

    /* valida os form de criacao e edição */ 
    formValidadeInstituicao();
})

