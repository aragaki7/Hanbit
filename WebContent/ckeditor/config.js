/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
 // Define changes to default configuration here. For example:
 config.width = '100%';
 config.height = '300px';
 config.language = 'ko';
    config.filebrowserImageUploadUrl = '/rear/editorUpload.do';
    
    config.removePlugins = 'flash';

    // add in TA-CMS Plugin
    config.extraPlugins = 'mediaCenter';

};

CKEDITOR.on('dialogDefinition', function( ev ){
 
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
  
    switch (dialogName) {
    
      case 'image': //Image Properties dialog
    //dialogDefinition.removeContents('info');
    //dialogDefinition.removeContents('Link');
    dialogDefinition.removeContents('advanced');
            break;
            
    }
    
});

CKEDITOR.plugins.add('mediaCenter', {
    init: function (editor) {
     
     editor.ui.addButton('mediaCenter', {
                label: '미디어센터',
                command: 'InsertMedia',
                icon: CKEDITOR.plugins.getPath('newplugin') + 'mybuttonicon.gif'
        });
     
        var cmd = editor.addCommand('InsertMedia', { exec: function(e){
         e.insertHtml('<img src="http://blogpfthumb.phinf.naver.net/20141013_89/action1020_1413130798443sR210_PNG/112.PNG?type=w161"/><br/>' + CKEDITOR.plugins.getPath('newplugin') + '<br/> ');
        }});
    }
});