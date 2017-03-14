function handleNovaRepasseCategoria(event){
    var dialogRepasseform = $('.dialog-wrapper').html();
    bootbox.dialog({
        message: dialogRepasseform,
        closeButton: false,
        size: 'large',
        backdrop: true,
        onEscape: true
    });
}

function handleFormRepasseCategoria(){
    var options ={
        rules: {
            "repasse_categoria[nome]": {
                required: true,
                maxlength: 30
            }
        },
        messages: {
            "repasse_categoria[nome]":{
                required: "Nome é obrigatório",
                    maxlength: "Tamanho máximo 30 caracteres"
            }
        },
        errorElement: 'div',
        errorLabelContainer: '.errorTxt'
    }; 
    $('new_repasse_categoria').validate(options);
}


$(document).ready(function(){
    $('.nova-repasse-categoria').on('click',handleNovaRepasseCategoria);
    handleFormRepasseCategoria();
})

// $( document ).on('turbolinks:load', function() {
//     $('.nova-repasse-categoria').on('click',handleNovaRepasseCategoria);
//     handleFormRepasseCategoria();
// })
