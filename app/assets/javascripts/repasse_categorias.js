function handleNovaRepasseCategoria(event){
    $('.dialog-wrapper').show();
    $('.dialog-wrapper').find('form')[0].reset();

    $('.dialog-wrapper').on('click', function(event){
        if(event.target === this) $(this).fadeOut();
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


$( document ).on('turbolinks:load', function() {
    $('.nova-repasse-categoria').on('click',handleNovaRepasseCategoria);
    handleFormRepasseCategoria();
})
