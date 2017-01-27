$(document).ready(function() {
  $('.i-topic').click(function(){
    var topic = $(this).find('input').val();
    // reset all categories
    $('.i-topic').removeClass('active-topic');
    $('.i-topic').find('.topic-title').css('color', '#656565');
    $('.category').removeClass('active-category');
    $('.all').addClass('active-category');
    $('.act').hide();
    $('.def').show();
    // make active clicked category
    $(this).find('.def').hide();
    $(this).find('.act').show();
    $(this).find('.topic-title').css('color', '#d3215d');
    $(this).addClass('active-topic');
    $.ajax({
      type: 'GET',
      url: '/posts?topic=' + topic,
      dataType: 'script'
    })
  })

  $('.category').click(function(){
    debugger;
      var category = $(this).find('input').val() == undefined ? '' : $(this).find('input').val()
      var topic = $('.active-topic').find('input').val() == undefined ? '' : $('.active-topic').find('input').val();
      $('.category').removeClass('active-category');
      $(this).addClass('active-category');
      $.ajax({
        type: 'GET',
        url: '/posts?category=' + category + '&topic=' + topic,
        dataType: 'script'
      })
  })

  $('.chosen-drop').click(function(){
    debugger;
    var category = $('.active-category').find('input').val() == undefined ? '' : $('.active-category').find('input').val();
    var topic = $('.active-topic').find('input').val() == undefined ? '' : $('.active-topic').find('input').val();
    var order = $('.result-selected').data('option-array-index') == 0 ? 'asc' : 'desc'
    $.ajax({
      type: 'GET',
      url: '/posts?topic=' + topic + '&category=' + category + '&order=' + order,
      dataType: 'script'
    })
  })

  $('#load-more-link').click(function(e) {
    e.preventDefault();
    var category = $('.active-category').find('input').val() == undefined ? '' : $('.active-category').find('input').val()
    var topic = $('.active-topic').find('input').val();
    var order = $('.result-selected').data('option-array-index') == 0 ? 'asc' : 'desc'
    var url = $(this).attr('href')
    $.ajax({
      type: 'GET',
      url: url + "&category="+ category + "&topic=" + topic + '&order=' + order,
      dataType: 'script'
    })
  });
});
