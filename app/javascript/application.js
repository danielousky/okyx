// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from 'jquery';
window.jQuery = jquery;
window.$ = jquery;

import "popper"
import "bootstrap"
import "trix"
import "@rails/actiontext"

document.addEventListener('DOMContentLoaded', function () {

	$('.onlyOneCharacter').on('input', function(evt) {
		var node = $(this);
		node.val(node.val());
	});

	$('.upcase').on('input', function(evt) {
		var node = $(this);
		node.val(node.val().toUpperCase());
	});

	$('.onlyNumbers').on('input', function(evt) {
		var node = $(this);
		node.val(node.val().replace(/[^0-9]/g, ''));
	});

	$('.maxSize').on('input', function(e) {
		let node = $(this);

		let size = node.attr('size')
		if (size == null) { size = 11 };
		size = parseInt(size)
		node.val(node.val().substring(0, size))
	})

	let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
	let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
    	return new bootstrap.Popover(popoverTriggerEl)  
	})  

	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})

});