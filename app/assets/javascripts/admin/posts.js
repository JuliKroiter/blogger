$(document).on('ready', function() {
  $('#posts-datatable').dataTable({
    pagingType: 'full_numbers'
  });

  // Prev image post
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_image").change(function(){
    $('#img_prev').removeClass('hidden');
    readURL(this);
  });

  $('#post_topic_id').change(function(e){
    $.ajax({
      dataType: "json",
      url: "/admin/categories/topic_categories",
      data: {topic_id: this.value},
      success: function(data){
        var output = [];

        $.each(data, function(key, category)
        {
          output.push('<option value="'+ category.id +'">'+ category.title +'</option>');
        });

        $('#post_category_id').html(output.join(''));
      }
    });
  })
});