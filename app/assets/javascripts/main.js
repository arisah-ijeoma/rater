// Intro Slider
$(document).ready(function () {
    "use strict";
    $("#intro-slider").owlCarousel({
        navigation: true, 
        slideSpeed: 600,
        pagination: false,
        singleItem: true,
        transitionStyle: "fadeUp",
	   autoPlay: 4000
    });

    // blog
    var owl = $("#m-blog");
    owl.owlCarousel({
        itemsCustom: [
            [0, 1],
            [450, 1],
            [600, 2],
            [700, 2],
            [1000, 2],
            [1200, 2],
            [1400, 2],
            [1600, 2]
        ],
        navigation: false
    });

    $("#testimonials").owlCarousel({
        navigation: true, // Show next and prev buttons
        pagination: false,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true
    });

     var owl = $("#m-clients");
    owl.owlCarousel({
        itemsCustom: [
            [0, 1],
            [450, 2],
            [600, 2],
            [700, 2],
            [1000, 3],
            [1200, 4],
            [1400, 4],
            [1600, 4]
        ],
        navigation: true,
        pagination: false

    });

    // Jquery Tab
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('#verticalTab').easyResponsiveTabs({
        type: 'vertical',
        width: 'auto',
        fit: true
    });

    // NAvigation
    $('.dropdown').toggleClass('inactive-header');
    // The Dropdown
    $('.dropdown').click(function () {
        if($(this).is('.inactive-header')) {
            $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
            $(this).toggleClass('active-header').toggleClass('inactive-header');
            $(this).next().slideToggle().toggleClass('open-content');
        }
        
        else {
            $(this).toggleClass('active-header').toggleClass('inactive-header');
            $(this).next().slideToggle().toggleClass('open-content');
        }
    });

    $('#m-team').flexslider({
        controlsContainer: ".m-team",
        controlNav: true,
        manualControls: ".mt-nav li"
    });

    $("a[class^='prettyPhoto']").prettyPhoto({
        theme: 'pp_default'
    });

    $("html").niceScroll();

    $('.m-hide i').on( "click", function() {
        if($('.m-hide i').hasClass('fa-plus-circle')) {       
            $(this).removeClass('fa-plus-circle').addClass('fa-minus-circle');
        }
        else{
            $(this).removeClass('fa-minus-circle').addClass('fa-plus-circle');
        }
    });

});


	

// Animated Skills
jQuery(document).ready(function ($) {
    $('.round-skills').appear(function () {

        options = {
            img1: 'img/c1.png',
            img2: 'img/c3.png',
            speed: 10,
            percent: 10,
            limit: 42,
            onInit: function () {
                console.log('init');
            },
            onProgress: function (p) { /*console.log('progress',p);*/ },
            onComplete: function (p) {
                console.log('complete', p);
            }
        };

        myplugin = $('#skill1').cprogress(options);

    }, {
        accX: 0,
        accY: -200
    });

     $('.round-skills').appear(function () {

        options = {
            img1: 'img/c1.png',
            img2: 'img/c3.png',
            speed: 10,
            percent: 10,
            limit: 68,
            onInit: function () {
                console.log('init');
            },
            onProgress: function (p) { /*console.log('progress',p);*/ },
            onComplete: function (p) {
                console.log('complete', p);
            }
        };

        myplugin = $('#skill2').cprogress(options);

    }, {
        accX: 0,
        accY: -200
    });

     $('.round-skills').appear(function () {

        options = {
            img1: 'img/c1.png',
            img2: 'img/c3.png',
            speed: 10,
            percent: 10,
            limit: 30,
            onInit: function () {
                console.log('init');
            },
            onProgress: function (p) { /*console.log('progress',p);*/ },
            onComplete: function (p) {
                console.log('complete', p);
            }
        };

        myplugin = $('#skill3').cprogress(options);

    }, {
        accX: 0,
        accY: -200
    });

     $('.flat-skills').appear(function() {
        $("#f-skill1 span").attr('style', 'width:95%;');
        $("#f-skill2 span").attr('style', 'width:39%;');
        $("#f-skill3 span").attr('style', 'width:75%;');
        $("#f-skill4 span").attr('style', 'width:23%;');
        $("#f-skill5 span").attr('style', 'width:52%;');
    },{accX: 0, accY: -200});
});



/* Hidden content js */
/* Animation */

if ( $(window).width() > 739) {     
    $('[data-animated]').each(function() {
        $(this).addClass('animated-out');
    });

    $(window).scroll(function() {
        var scroll      = $(window).scrollTop();
        var height      = $(window).height();
        $('.animated-out[data-animated]').each(function() {
            var $this   = $(this);
            if(scroll + height >= $this.offset().top) {
                var delay   = parseInt($this.attr('data-animated'));
                if(isNaN(delay) || 0 === delay) {
                    $this.removeClass('animated-out').addClass('animated-in');
                } else {
                    setTimeout(function() {
                        $this.removeClass('animated-out').addClass('animated-in');
                    }, delay);
                }
            }
        });
});

}
