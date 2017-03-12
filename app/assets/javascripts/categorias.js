
function handleNovaCategoria(event){
    $('.dialog-wrapper').show();
    $('.dialog-wrapper').find('form')[0].reset();

    $('.dialog-wrapper').on('click', function(event){
        if(event.target === this) $(this).fadeOut();
    });
}

function handleFormCategoria(){
    var options ={
        rules: {
            "categoria[nome]": {
                required: true,
                maxlength: 30
            }
        },
        messages: {
            "categoria[nome]":{
                required: "Nome é obrigatório",
                    maxlength: "Tamanho máximo 30 caracteres"
            }
        },
        errorElement: 'div',
        errorLabelContainer: '.errorTxt'
    }; 
    $('#new_categoria').validate(options);
}


$( document ).on('turbolinks:load', function() {
    $('.nova-categoria').on('click',handleNovaCategoria);
    handleFormCategoria();
});
