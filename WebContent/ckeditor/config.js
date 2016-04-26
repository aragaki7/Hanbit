/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

//CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.uiColor = '#AADC6E';
	
	CKEDITOR.editorConfig = function( config ) {
		config.uiColor = '#D5D5D5';
		config.language = 'ko';
		config.toolbar = [
		          		{ name: 'clipboard', items: ['Undo', 'Redo'] },
		          		{ name: 'editing', items: [ 'Find', 'Replace','SelectAll' ] },
		          		'/',
		          		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'] },
		          		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
		          		{ name: 'insert', items: [ 'Image', 'Table', 'Smiley', 'SpecialChar',] },
		          		'/',
		          		{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
		          		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
		          	];
};
