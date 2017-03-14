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
//= require jquery_ujs
//= require jquery_nested_form/
//= require jquery.validate
//= require dataTables/jquery.dataTables
//= jquery.validate.localization
//= require jquery.mask
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootbox
//= require app
//require turbolinks
//= require_tree .


/** fix adminlte issues */
// $(document).ready(function() {
//     $.AdminLTE.layout.activate();
// });

// function adminLTEFix(){
//     var o;
//     console.log("rodei o fix");
//     o = $.AdminLTE.options;
//     if (o.sidebarPushMenu) {
//         $.AdminLTE.pushMenu.activate(o.sidebarToggleSelector);
//     }
//     $.AdminLTE.layout.activate();
// }
// $(document).on('page:load',adminLTEFix);

function handleGenerickClicks(){
    $('.link-holder').on('click', 'i', function(event){
        event.preventDefault();
        var link = $(this);
        bootbox.confirm("Tem Certeza?", function(sim){
            if(sim){
                link.next().click();
            } else {
                bootbox.hideAll();
            }
        })
    });
}

function displayNotice(content){
    if(content.type){
        bootbox.alert({
            title: content.title,
            message: content.notice
        });
    }
}

$(document).ready(function(){
    handleGenerickClicks();
});
// $( document ).on('turbolinks:load', function() {
//     handleGenerickClicks();
// });
