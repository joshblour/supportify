CKEDITOR.editorConfig = function( config )
{

  config.toolbar_Mini =
    [
        [ 'Source', '-', 'NewPage', 'Preview', 'Print', '-', 'Templates' ],
        ['Undo','Redo'], 
        ['Table', 'HorizontalRule', 'Iframe'],
        '/',
        ['Format', 'Font', 'FontSize', 'TextColor', 'BGColor' ], ['Styles'],  
        ['Bold','Italic','Underline','Strike'], 
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    ];
}