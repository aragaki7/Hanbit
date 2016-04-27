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
		
		//ckeditor 기본설정
		config.uiColor = '#D5D5D5'; //ui컬러
		config.language = 'ko'; //사용할언어
		config.height = '400px'; //높이
		config.resize_enabled = false; //창크기조절 x
		config.enterMode = CKEDITOR.ENTER_BR; //엔터키누를시 br
		config.shiftEnterMode = CKEDITOR.ENTER_P; //쉬프트엔터누를시 p
		config.font_defaultLabel = 'Gulim'; // 기본글씨체 굴림
		config.fontSize_defaultLabel = '12px'; //기본글씨크기 12
		config.startupFocus = true;
		
		//ckfinder 경로
		config.filebrowserBrowseUrl = '../ckfinder/ckfinder.html';
		config.filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images';
		config.filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash';
		config.filebrowserUploadUrl = '/Hanbit/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
		config.filebrowserImageUploadUrl = '/Hanbit/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
		config.filebrowserFlashUploadUrl = '/Hanbit/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
		
		//ckeditor 툴바
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
