(function($) {

    // Carousel
    $(function() {
        $('.jcarousel').jcarousel({
           wrap: "circular"
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
            var items = $(".jcarousel li").length;

            itemsText.text(items);
        });    
    });

})(jQuery);     