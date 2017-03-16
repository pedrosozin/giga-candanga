var instStyle = 'style = "text-align:center; margin-top: 15px; font-size:1.8rem;"';
var instEventMesseges = {
    ARQUIVA_CONFIRM: '<p '+instStyle+' >Tem certeza que deseja arquivar? Todos os instrumentos jurídicos e conexões relacionadas também serão arquivadas!</p>'
};

var choseDefaltOptions = {
    placeholder_text_single: "Seleciona Uma opção",
    search_contains: true,
    allow_single_deselect: true,
    no_results_text: "Nenhum resultado encontrado"
};


function handleInstituicoesEvents(){

    $('.link-delete.instituicao').on("click",'i',function(event){
        event.preventDefault();
        var link = $(this);
        bootbox.confirm({
            message: instEventMesseges.ARQUIVA_CONFIRM,
            size: "large",
            callback: function(sim){
                if(sim){
                    var clickable = link.next().click();
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
    $('#new_instituicao input, #edit_instituicao input').removeAttr('data-disable-with');
    $('.edit_instituicao input, #edit_instituicao input').removeAttr('data-disable-with');
    /* geral */
    // $('.chosen-select').chosen(Object.assign({},choseDefaltOptions,{width: '130px'}));

    $('.bootstrap-date').datepicker({autoclose:true, language: "pt"});

    // mascaras
    $('input[name="instituicao[cnpj]"]').mask('00.000.000/0000-00', {reverse: true});
    $('input[name="instituicao[endereco_attributes][cep]"]').mask('00000-000');
    $('input[name="instituicao[data_aprovacao]"]').mask('00/00/0000');
    $('input[phone=s]').mask('(00)00000-0000');



    /* editar */
    $('[id*=edit_instituicao] input').prop("disabled", true);
    $('[id*=edit_instituicao] textarea').prop("disabled", true);
    $('[id*=edit_instituicao] select').prop("disabled", true);
    // é necessario dar trigger nesse evento para rerenderizar a combo box com a nova config do select

    // $('#new_instituicao').on('submit', instituicaoFormSubmit);
}

function addCustomRules(){
    $.validator.setDefaults({ ignore: ":hidden:not(.chosen-select)" });
    jQuery.validator.addMethod("validCnpj", function(value, element) {
        return this.optional(element) || validarCNPJ(value);
    }, "cnpj inválido");

    jQuery.validator.addMethod("cep", function(value, element) {
        return this.optional(element) || /^[0-9]{5}-[0-9]{3}$/.test(value);
    }, "Por favor, digite um CEP válido");

    jQuery.validator.addMethod("respnome", function(value, element) {
        return (($(element).val().length == 0) && ($(element).parent().parent().find('[name*="cargo"]').val().length == 0)) || value.length > 0;
    }, "Nome é obrigatório caso preencha o responsável");

}
// form submit
function instituicaoFormSubmit(form){
    var resCount = [];
    $('[id*="instituicao_responsaveis"][name*="nome"]').each(function(){
        if($(this).val().length > 0) resCount++;
    });
    if(resCount == 0){
        bootbox.confirm("Você não preencheu nenhum responsável, tem certeza que deseja salvar?", function(sim){
            if(sim) return form.submit();
            else  {
                bootbox.hideAll();
                return false;
            }
        });

    } else {
        return form.submit();
    }
}

function formValidadeInstituicao(){
    addCustomRules();
    var options = {
        submitHandler: instituicaoFormSubmit,
        rules: {
            "instituicao[nome]":{
                required: true,
                minlength: 2,
                maxlength: 55
            },
            "instituicao[categoria_id]": "required",
            "instituicao[cnpj]": { validCnpj: true},
            "instituicao[sigla]": {
                required: true,
                maxlength: 20
            },
            "instituicao[resumo]": { maxlength: 500},
            "instituicao[endereco_attributes][cep]": {cep:true},
            "instituicao[endereco_attributes][cidade]": {
                maxlength: 30
            },
            "instituicao[endereco_attributes][estado]": {
                maxlength: 30
            },
            "instituicao[endereco_attributes][bairro]": {
                maxlength: 30
            },
            "instituicao[endereco_attributes][endereco]": {
                maxlength: 150
            },
            "*[cargo]": {required: true}

        },

        messages: {
            "instituicao[nome]":{
                required: "Nome é obrigatório",
                minlength: jQuery.validator.format("Nome precisa conter no mínimo {0} caracteres"),
                maxlength: jQuery.validator.format("Nome pode conter no máximo {0} caracteres")
            },
            "instituicao[categoria_id]": "Categoria é obrigatória",
            "instituicao[sigla]": {
                required: "Sigla é obrigatória",
                maxlength: jQuery.validator.format( "Sigla pode conter no máximo {0} caracteres" )
            },
            "instituicao[resumo]": { maxlength: jQuery.validator.format( "Resumo pode conter no máximo {0} caracteres" ) }
        },
        errorElement: 'div',
        errorLabelContainer: '.errorTxt'
    };

    if($("#new_instituicao").length > 0){
        $("#new_instituicao").validate(options);

        $('[id*="instituicao_responsaveis"][name*="nome"]').each(function(){
            $(this).rules('add', {
                respnome:true
            });
        });
    }
    // libera form para edição e aplica validacao
    $('a.editar-form').on('click', function(e){
        e.preventDefault();
        $('[id*=edit_instituicao] input').prop("disabled", false);
        $('[id*=edit_instituicao] textarea').prop("disabled", false);
        $('[id*=edit_instituicao] select').prop("disabled", false);
        $(".edit_instituicao").validate(options);

        // $('[id*="instituicao_responsaveis"][name*="nome"]').each(function(){
        //     $(this).rules('add', {
        //         respnome:true
        //     });
        // });
    });
}

function setCustomStyles() {
    // if ($('#instituicao-index-tb').length > 0 ) {
    //     $('#instituicao-index-tb').DataTable({
    //         "paging": true,
    //         "lengthChange": false,
    //         "searching": true,
    //         "ordering": true,
    //         "info": true,
    //         "autoWidth": true
    //     });
    // }
}

$(document).ready(function(){
    handleInstituicoesEvents();
    formCustomization();
    setCustomStyles();
    /* valida os form de criacao e edição */
    formValidadeInstituicao();
});

// $( document ).on('turbolinks:load', function() {
//     handleInstituicoesEvents();
//     formCustomization();
//     setCustomStyles();
//     /* valida os form de criacao e edição */
//     formValidadeInstituicao();
// });




function validarCNPJ(cnpj) {

    cnpj = cnpj.replace(/[^\d]+/g,'');

    if(cnpj == '') return false;

    if (cnpj.length != 14)
        return false;

    // Elimina CNPJs invalidos conhecidos
    if (cnpj == "00000000000000" ||
        cnpj == "11111111111111" ||
        cnpj == "22222222222222" ||
        cnpj == "33333333333333" ||
        cnpj == "44444444444444" ||
        cnpj == "55555555555555" ||
        cnpj == "66666666666666" ||
        cnpj == "77777777777777" ||
        cnpj == "88888888888888" ||
        cnpj == "99999999999999")
        return false;

    // Valida DVs
    tamanho = cnpj.length - 2
    numeros = cnpj.substring(0,tamanho);
    digitos = cnpj.substring(tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(0))
        return false;

    tamanho = tamanho + 1;
    numeros = cnpj.substring(0,tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(1))
        return false;

    return true;

}
