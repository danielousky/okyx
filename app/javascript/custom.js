import jquery from 'jquery';
window.jQuery = jquery;
window.$ = jquery;
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
});
