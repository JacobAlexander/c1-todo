// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
jQuery.fn.reverse = [].reverse;
$(document).on('ready page:load', function () {


    $('.boards .board, .tasks .task').on({
        mouseover: function () {
            $(this).addClass('hover');
        },
        mouseout: function () {
            $(this).removeClass('hover');
        }
    });
    $('.mark-task a.btn').on('click', function(){

        if ($(this).parent().hasClass('current-status-normal')){
            $(this).parent().parent().addClass('task-finished');
            $(this).parent().addClass('current-status-marked');
            $(this).parent().removeClass('current-status-normal');
        } else if ($(this).parent().hasClass('current-status-marked')) {
            $(this).parent().parent().removeClass('task-finished')
            $(this).parent().removeClass('current-status-marked');
            $(this).parent().addClass('current-status-normal');
        }

    });
    $('.boards .board a.btn, .tasks .task a.btn').on({
        mouseover: function () {
            $(this).addClass('btn-current');
            $(this).parent().parent().addClass('btn-hovered');
        },
        mouseout: function () {
            $(this).removeClass('btn-current');
            $(this).parent().parent().removeClass('btn-hovered');
        }
    });

    if ($('.form-sI').length) {
        var focused = $('.form-sI').find('.form-i').find('input, textarea').first().focus();

        if ($('.form-sI-select').length) {
            focused.select()
        }
    }
    var msgs = $('.flash-msg').length;
    $('.flash-msg').reverse().each(function(i){
        var time = (i+1)*1000
        if (i == msgs-1){
            $('.flash-msg-container').delay(time).fadeOut(500);
        } else {
            $(this).delay(time).fadeOut(500);
        }
    })


});