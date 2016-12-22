$(document).on("submit", "form[data-turboform]", function(e) {
  Turbolinks.visit(this.action+(this.action.indexOf('?') == -1 ? '?' : '&')+$(this).serialize());
  return false;
});

$(document).ready(function(){
  $('#calendar').fullCalendar({
    defaultDate: '2016-12-18',
    editable: true,
    eventLimit: true,

    // EVENTS
    events:[
      {
        url: '',
        title: 'Система восстановления',
        start: '2016-12-22'
      }
    ]

  });

  $('.b-load.shadow').click(function(){
    var url = $('.pagination .next a').attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      $('.pagination').text("Ожидайте...");
      return $.getScript(url);
    }
  });
});
