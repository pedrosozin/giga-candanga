
function handleNovaCategoria(event){
    var dialogForm = $('.dialog-wrapper').html();
    bootbox.dialog({
        message:dialogForm,
        closeButton: false,
        className: 'modal-medium',
        backdrop: true,
        onEscape: true
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


$(document).ready(function(){
    $('.nova-categoria').on('click',handleNovaCategoria);
    handleFormCategoria();
});