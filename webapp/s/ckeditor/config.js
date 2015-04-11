/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbarCanCollapse = true;//工具栏是否可以被收缩
	config.toolbarLocation = 'top';//可选：bottom//工具栏的位置
	config.toolbarStartupExpanded = false;//工具栏默认是否展开

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
  

	config.toolbar = 'MyToolbar';
	config.removePlugins='elementspath';
		
    config.toolbar_MyToolbar =
    [
		{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 
		'HiddenField' ] },
		'/',
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight' ] },
		{ name: 'links', items : [ 'Link'] },
		{ name: 'insert', items : [ 'Image','Table' ] },
		{ name: 'styles', items : [ 'Format','Font','FontSize' ] }
	//	{ name: 'tools', items : [ 'Print','Maximize'] }
    ];
   
    
    
};
