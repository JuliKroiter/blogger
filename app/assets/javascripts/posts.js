$(document).ready(function() {
  $('.i-category').click(function(){
    var category = $(this).find('input').val();
    // reset all categories
    $('.i-category').removeClass('active-category');
    $('.i-category').find('.category-title').css('color', '#656565');
    $('.topic').removeClass('active-topic');
    $('.all').addClass('active-topic');
    $('.act').hide();
    $('.def').show();
    // make active clicked category
    $(this).find('.def').hide();
    $(this).find('.act').show();
    $(this).find('.category-title').css('color', '#d3215d');
    $(this).addClass('active-category');
    $.ajax({
      type: 'GET',
      url: '/posts?category=' + category,
      dataType: 'script'
    })
  })

  $('.topic').click(function(){
    var topic = $(this).find('input').val() == undefined ? '' : $(this).find('input').val()
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
    var category = $('.active-category').find('input').val() == undefined ? '' : $('.active-category').find('input').val();
    var topic = $('.active-topic').find('input').val() == undefined ? '' : $('.active-topic').find('input').val();
    var order = $('.result-selected').data('option-array-index') == 0 ? 'asc' : 'desc'
    $.ajax({
      type: 'GET',
      url: '/posts?topic=' + topic + '&category=' + category + '&order=' + order,
      dataType: 'script'
    })
    })
});
