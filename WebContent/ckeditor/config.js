/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

	//CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.uiColor = '#AADC6E';
	
	// 게시판 툴바 수정 
	

	//
	//게시판 툴바 작성
	CKEDITOR.editorConfig = function( config ) {
		config.uiColor = '#D5D5D5';
		config.language = 'ko';
		config.height = '400px';
		config.resize_enabled = false;
		config.enterMode = CKEDITOR.ENTER_BR;
		config.shiftEnterMode = CKEDITOR.ENTER_P;
		config.font_defaultLabel = 'Gulim';
		config.fontSize_defaultLabel = '12px';
		config.startupFocus = true;
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
