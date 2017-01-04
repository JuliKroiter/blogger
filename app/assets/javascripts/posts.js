$(document).ready(function() {
  $('.i-category').click(function(){
    debugger;
    var category = $(this).find('input').val();
    $(this).find('.def').hide();
    $(this).find('.act').show();
    $('.topic').removeClass('active-topic');
    $('.all').addClass('active-topic');
    $('.i-category').removeClass('active-category');
    $(this).addClass('active-category');
    $.ajax({
      type: 'GET',
      url: '/posts?category=' + category,
      dataType: 'script'
    })
  })

  $('.topic').click(function(){
    debugger;
    var topic = $(this).find('input').val();
    var category = $('.active-category').find('input').val();
    $('.topic').removeClass('active-topic');
    $(this).addClass('active-topic');
    $.ajax({
      type: 'GET',
      url: '/posts?topic=' + topic + '&category=' + category,
      dataType: 'script'
    })
  })

  $('.chosen-drop').click(function(){
    debugger;
    var category = $('.active-category').val() == undefined ? '' : $('.active-category').val();
    var topic = $('.active-topic').val();
    var order = $('.result-selected').data('option-array-index') == 0 ? 'asc' : 'desc'
    $.ajax({
      type: 'GET',
      url: '/posts?topic=' + topic + '&category=' + category + '&order=' + order,
      dataType: 'script'
    })
    })
});
