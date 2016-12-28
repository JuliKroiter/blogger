document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/g, '');


$(document).ready(function() {

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

    $(".b-popup .close").on("click", function(){
        closePopup();
    });

    function closePopup(){
        $(".w-popup").delay(800).fadeOut(250);

        setTimeout(
            function(){
                $(".b-popup").removeClass("is-open");
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
