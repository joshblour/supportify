(function() {
  jQuery(function() {
    
    function convertToSlug(Text)
    {
      return Text.toLowerCase().replace(/ +/g,'-').replace(/[^a-z0-9-_]/g,'').replace(/-+/g,'-');
    }
  
  
    function insertParam(key, value)
    {
        key = encodeURI(key); value = encodeURI(value);

        var kvp = document.location.search.substr(1).split('&');

        var i=kvp.length; var x; while(i--) 
        {
            x = kvp[i].split('=');

            if (x[0]==key)
            {
                x[1] = value;
                kvp[i] = x.join('=');
                break;
            }
        }

        if(i<0) {kvp[kvp.length] = [key,value].join('=');}

        //this will reload the page, it's likely better to store this until finished
        document.location.search = kvp.join('&'); 
    }
  
    $("#article_title, #article_locale").on('change input', function() {
      title = $('#article_title').val();
      locale = $('#article_locale').find('option:selected').text();
      $(this).parents('form').find("input[id$='article_slug']").val(convertToSlug(title + '-' + locale));
    });
  
    $("#set_locale").on('change', function() {
      insertParam('locale', $(this).find('option:selected').text());
    });

    $.each($('#article_tag_list, #article_category_list, #article_admin_tag_list'),
      function (i, element) {
        var list =  $(element).data('options')
        $(element).select2({
          tags: list,
          width: '300px'   
        });
      });
  });
}).call(this);
