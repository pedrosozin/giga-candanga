function handleNovaRepasseCategoria(event){
    var dialogRepasseform = $('.dialog-wrapper').html();
    bootbox.dialog({
        message: dialogRepasseform,
        closeButton: false,
        className: 'modal-medium',
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

function repasseEvents(){
    /*  mostra e esconde categorias */
    $('a[repasse-toggle-ativas]').on('click', function(){
        $('.categorias-inativas-listing').fadeOut(500, function(){
            $('.categorias-ativas-listing').fadeIn(500);
        });
    });
    $('a[repasse-toggle-inativas').on('click', function(){
        $('.categorias-ativas-listing').fadeOut(500, function(){
            $('.categorias-inativas-listing').fadeIn(500);
        });
    });
}

function customizeRepasse(){
    $('#categorias-ativas-listing').DataTable(dataTableDefaultOptions);

    $('#categorias-inativas-listing').DataTable(dataTableDefaultOptions);
}

$(document).ready(function(){
    $('.nova-repasse-categoria').on('click',handleNovaRepasseCategoria);
    handleFormRepasseCategoria();
    customizeRepasse();
    repasseEvents();
})
;
