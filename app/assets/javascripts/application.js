// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery-ui
//= require bootstrap-sprockets
//= require_tree .



var Page, bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
Page = (function() {
  function Page() {
    this.action = bind(this.action, this);
    this.controller = bind(this.controller, this);
  }
  Page.prototype.controller = function() {
    return $('body').attr('controller');
  };
  Page.prototype.action = function() {
    return $('body').attr('action');
  };
  return Page;
})();
this.page = new Page;