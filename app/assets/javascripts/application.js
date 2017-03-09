// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require jquery.validate
//= jquery.validate.localization
//= require jquery_nested_form/
//= require turbolinks
//= require app
//= require admin-lte
//= require bootstrap-sprockets
//= require bootbox
//= require bootstrap-datepicker
//= require chosen-jquery
//= require_tree .

function normalizaAlturaSidebar(){
    let height = $('.app-sidebar').next().height();
    $('.app-sidebar').height(height);

    const target = $('html')[0];

    // create an observer instance
    var observer = new MutationObserver(function(mutations) {
        let height = $('.app-sidebar').next().height();
        $('.app-sidebar').height(height);
    });

    var config = { attributes: true, childList: true, characterData: true };

    // pass in the target node, as well as the observer options
    observer.observe(target, config);
}


function displayNotice(content){
    if(content.type){
        bootbox.alert({
            title: content.title,
            message: content.notice
        });
    }
}


$( document ).on('turbolinks:load', function() {

    normalizaAlturaSidebar();
});
