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

});
