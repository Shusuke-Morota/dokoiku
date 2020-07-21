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
//= require turbolinks
//= require jquery
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(function() {
	$('.slider1').slick({
		fade: true,
		speed: 3000,
		autoplay: true,
		autoplaySpeed: 5000,
		prevArrow: '<img src="前への矢印画像のパス" class="slide-arrow prev-arrow">',
		nextArrow: '<img src="次への矢印画像のパス" class="slide-arrow next-arrow">'
	});
});


