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
//= require toastr_rails
//= require foundation
//= require ahoy
//= require turbolinks
//= require_tree .

$(document).foundation();

var showToast = function(flash){
  for(var i = 0; i < flash.length; i++ ){
    var msg = flash[i];
    var type = {
      notice: 'success',
      alert: 'error',
      warning: 'warning',
      info: 'info'
    };
    var options = {
      notice: {},
      alert: { "timeOut": "0", "extendedTimeOut": "0" },
      warning: { "timeOut": "0", "extendedTimeOut": "0" },
      info: {}
    };
    if(toastr[type[msg[0]]]) {
      toastr[type[msg[0]]](msg[1], '', options[msg[0]]);
    }
  }
};

var getParameterByName = function(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}