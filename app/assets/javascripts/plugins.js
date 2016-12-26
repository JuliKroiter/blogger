
$(document).ready(function() {
    // Carousel
    $(function() {
        $('.jcarousel').jcarousel({
           wrap: "circular",
           animation: 200

        });

        $('.jcarousel-control-prev').on('jcarouselcontrol:active', function() {
            $(this).removeClass('inactive');
        }).on('jcarouselcontrol:inactive', function() {
               $(this).addClass('inactive');
        }).jcarouselControl({
            target: '-=1'
        });

        $('.jcarousel-control-next').on('jcarouselcontrol:active', function() {
            $(this).removeClass('inactive');
        }).on('jcarouselcontrol:inactive', function() {
            $(this).addClass('inactive');
        }).jcarouselControl({
            target: '+=1'
        });

        $('.jcarousel-pagination').jcarouselPagination({
            item: function(page) {
                return '<a href="#' + page + '">' + page + '</a>';
            }
        });

        $('.jcarousel-pagination').on('jcarouselpagination:active', 'a', function() {
                $(this).addClass('active');
            }).on('jcarouselpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            }).jcarouselPagination();

        // Items
        $(".b-carousel").each(function(){
            var itemsText = $(this).find(".jcarousel-items");
            var items = $(this).find(".jcarousel li").length;

            itemsText.text(items);
        });

        // Vertical
        $('.b-carousel-v .jcarousel').jcarousel({
            wrap: "circular",
            vertical: true
        });

    });

    // Select
    $(".filter-select").length && $(".filter-select select").chosen();

    // Slick Slider
    if ( $(".b-slider-mobile").length ){
        var clones = $(".b-carousel-v .b-preview").clone(true);
        $(".b-slider-mobile").append(clones).slick({

            swipe:true,
            infinite: true,
            centerMode: true,
            dots:true,
            arrows: false,
            speed: 500,
            slidesToScroll: 1,
            slidesToShow: 3,

            responsive: [{
                breakpoint:767,
                settings: {
                    slidesToShow: 1
                }
            }]
        });
    }

    if ( $(".b-slider-p-mobile").length ){
        var clones = $(".b-carousel-p .b-polygraphy").clone(true);

        $(".b-slider-p-mobile").append(clones).slick({
            swipe:true,
            infinite: true,
            centerMode: false,
            dots:true,
            arrows: false,
            speed: 500,
            slidesToScroll: 1,
            slidesToShow: 1
        });
    }

})
