document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/g, '');


$(document).ready(function() {
     $(document).on('click', '.chevron ', function(){
        $(this).parent().css({'display': 'inline'})
      })

    // Placeholder Hide
    $("input, textarea").focus(function(){
       $(this).data("placeholder",$(this).attr("placeholder")).attr("placeholder","");
    }).blur(function(){
       $(this).attr("placeholder",$(this).data("placeholder"));
    });

	// Menu Drop
    (function(){
        var btn = document.querySelector("#btn-menu");

        btn.addEventListener( "click", function() {
          (this.classList.contains("is-active") === true) ? this.classList.remove("is-active") : this.classList.add("is-active");

          $(".w-menu-drop").slideToggle(200);
        });
    }());

    // Search Mobile
    $(".btn-search").on("click", function(){
        $(this).toggleClass("close");
        $(".b-search").slideToggle(200);
    });

    // Title Words Wrap
    $(".title-d div").lettering("words");
    $(".title-d div span").lettering();

     // Popup
    $("#btn-s").on("click", function(e){
        $(".w-popup").fadeIn(250);
        $("#popup-s").addClass("is-open").find(".close").addClass("is-show");

        e.preventDefault();
    });


    // $(".order-book").on("click", function(e){
    //     var book_id = $(this).attr('id');
    //     $('.popup h3').text('Заказать книгу');
    //     $('#book_id').val(book_id);
    //     $(".w-popup").fadeIn(250);
    //     $("#popup-s").addClass("is-open").find(".close").addClass("is-show");

    //     e.preventDefault();
    // });

    $('.learn-more').on("click", function(e){
        $('.popup h3').text('Узнать больше');
        $('#consultation-form input[type=submit]').val('узнать');
        $(".w-popup").fadeIn(250);
        $("#popup-s").addClass("is-open").find(".close").addClass("is-show");
        $('#learn_more').val('true');
        $('#mom_plan').val('');
    });

    $('.subscribe').on("click", function(e){
        $('.popup h3').text('Подпишитесь сейчас');
        $('#consultation-form input[type=submit]').val('подписаться');
        $(".w-popup").fadeIn(250);
        $("#popup-s").addClass("is-open").find(".close").addClass("is-show");
        $('#learn_more').val('true');
        $('#mom_plan').val('');
    });


    $('.mom-plan').on("click", function(e){
        $('.popup h3').text('Узнать больше');
        $('#consultation-form input[type=submit]').val('узнать');
        $(".w-popup").fadeIn(250);
        $("#popup-s").addClass("is-open").find(".close").addClass("is-show");
        $('#learn_more').val('');
        $('#mom_plan').val('true');
    });



    $(".order-consultation").on("click", function(e){
        $('.popup h3').text('Заказать консультацию');
        $('#consultation-form input[type=submit]').val('заказать');
        $(".w-popup").fadeIn(250);
        $("#popup-s").addClass("is-open").find(".close").addClass("is-show");
        $('#learn_more').val('');
        $('#mom_plan').val('');
        e.preventDefault();
    });


    $(".b-popup .close").on("click", function(){
        closePopup();
    });

    function closePopup(){
        $(".w-popup").delay(800).fadeOut(250);

        setTimeout(
            function(){
                $(".b-popup").removeClass("is-open");
                $('#email, #email-consultation').show();
                $('#order-form input[type=submit], #consultation-form input[type=submit]').val('заказать');
                $('#form-two input[type=submit]').val('связаться со мной');
                $('#name-2, #email-2').show();
        }, 400);


        $(".b-popup").find(".close").removeClass("is-show");
    }

    // $(".title-d span").each(function(){
    //     if ( $(this).text() === " " ){
    //          $(this).prev().css("padding-right","10px");
    //     }
    // });

    windowSize();
    $(window).resize(windowSize);
});

var cachedWidth = window.innerWidth;

function windowSize(){

    var winWidth = window.innerWidth;

    // Resize Mobile
    if (winWidth !== cachedWidth){


        cachedWidth = winWidth;
    }

    // Mobile Viewport
    if (winWidth >= 767){
        $(".b-search").attr("style", "");
        $(".btn-search").removeClass("close");

    } else {

    }
}


$(function() {
  return $('.infinite-table').infinitePages({
    loading: function() {
      return $(this).text('Loading next page...');
    },
    error: function() {
      return $(this).button('There was an error, please try again');
    }
  });

    // var $container = $('.infinite-table');
    // $container.imagesLoaded( function () {
    //   $container.masonry({
    //     itemSelector: '.box',
    //     percentPosition: true
    //   });
    // });


});
