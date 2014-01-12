// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(function ($) { // First argument is the jQuery object
  
  function convertToSlug(Text)
  {
    return Text.toLowerCase().replace(/ +/g,'-').replace(/[^a-z0-9-_]/g,'').replace(/-+/g,'-');
  }
  
  
  
  $("#article_title, #article_locale").on('change input', function() {
    title = $('#article_title').val();
    locale = $('#article_locale').find('option:selected').text();
    $(this).parents('form').find("input[id$='article_slug']").val(convertToSlug(title + '-' + locale));
  });


});

