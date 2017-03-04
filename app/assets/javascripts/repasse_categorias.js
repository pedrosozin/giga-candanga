function handleNovaRepasseCategoria(event){
    $('.dialog-wrapper').show();
    $('.dialog-wrapper').find('form')[0].reset();

    $('.dialog-wrapper').on('click', function(event){
        if(event.target === this) $(this).fadeOut();
    });
}


$( document ).on('turbolinks:load', function() {
    $('.nova-repasse-categoria').on('click',handleNovaRepasseCategoria);
})
