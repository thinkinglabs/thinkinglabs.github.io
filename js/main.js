
$(document).ready(function () {

    /*==============================================================*/
    //Navigation dropdown menu responsive - START CODE
    /*==============================================================*/
    $('body').on('touchstart click', function (e) {
        if ($(window).width() < 992) {
            if (!$('.navbar-collapse').has(e.target).is('.navbar-collapse') && $('.navbar-collapse').hasClass('in') && !$(e.target).hasClass('navbar-toggle')) {
                $('.navbar-collapse').collapse('hide');
            }
        }
    });
    /*==============================================================*/
    //Navigation dropdown menu responsive - END CODE
    /*==============================================================*/

});

/*==============================================================*/
//Navigation - START CODE
/*==============================================================*/
// Shrink nav on scroll
$(window).scroll(function () {
    if ($(window).scrollTop() > 10) {
        $('nav').addClass('shrink-nav');
    } else {
        $('nav').removeClass('shrink-nav');
    }
});
/*==============================================================*/
//Navigation - END CODE
/*==============================================================*/

/*==============================================================*/
//Parallax - START CODE
/*==============================================================*/
// Parallax Fix Image Scripts
//TODO remove jquery parallax plugin
$('.parallax-fix').each(function () {
    if ($(this).children('.parallax-background-img').length) {
        var imgSrc = jQuery(this).children('.parallax-background-img').attr('src');
        jQuery(this).css('background', 'url("' + imgSrc + '")');
        jQuery(this).children('.parallax-background-img').remove();
        $(this).css('background-position', '50% 0%');
    }
});
/*==============================================================*/
//Parallax - END CODE
/*==============================================================*/

/*==============================================================*/
//Smooth Scroll - START CODE
/*==============================================================*/
var scrollAnimationTime = 1200,
        scrollAnimation = 'easeInOutExpo';
$('a.scrollto').bind('click.smoothscroll', function (event) {
    event.preventDefault();
    var target = this.hash;
    $('html, body').stop()
            .animate({
                'scrollTop': $(target)
                        .offset()
                        .top
            }, scrollAnimationTime, scrollAnimation, function () {
                window.location.hash = target;
            });
});
// Inner links
$('.inner-link').smoothScroll({
    speed: 900,
    offset: -0
});
// Scroll To Down
function scrollToDown() {
    var target = $('#features');
    $('html, body').animate({ scrollTop: $(target).offset().top }, 800);
}
function scrollToDownSection() {
    var target = $('#about');
    $('html, body').animate({ scrollTop: $(target).offset().top }, 800);
}
/*==============================================================*/
//Smooth Scroll - END CODE
/*==============================================================*/

/*==============================================================*/
//Full Screen Header - START CODE
/*==============================================================*/

function SetResizeContent() {
    var minheight = $(window).height();
    $(".full-screen").css('min-height', minheight);
}

SetResizeContent();
/*==============================================================*/
//Full Screen Header - END CODE
/*==============================================================*/


/*==============================================================*/
//Window Resize Events - START CODE
/*==============================================================*/
$(window).resize(function () {
    //Position Fullwidth Subnavs fullwidth correctly
    $('.dropdown-fullwidth').each(function () {
        $(this).css('width', $('.row').width());
        var subNavOffset = -($('nav .row').innerWidth() - $('.menu').innerWidth() - 15);
        $(this).css('left', subNavOffset);
    });
    SetResizeContent();
    if ($(window).width() >= 992 && $('.navbar-collapse').hasClass('in')) {
        $('.navbar-collapse').removeClass('in');
        //$('.navbar-collapse').removeClass('in').find('ul.dropdown-menu').removeClass('in').parent('li.dropdown').addClass('open');
        $('.navbar-collapse ul.dropdown-menu').each(function () {
            if ($(this).hasClass('in')) {
                $(this).removeClass('in'); //.parent('li.dropdown').addClass('open');
            }
        });
        $('ul.navbar-nav > li.dropdown > a.dropdown-toggle').addClass('collapsed');
        $('.logo').focus();
        $('.navbar-collapse a.dropdown-toggle').removeClass('active');
    }
});
/*==============================================================*/
//Window Resize Events - END CODE
/*==============================================================*/

/*==============================================================*/
//Countdown Timer - START CODE
/*==============================================================*/
//TODO remove final countdown counter.js
$('#counter-underconstruction').countdown('2015/12/15 12:00:00').on('update.countdown', function (event) {
    var $this = $(this).html(event.strftime('' + '<div class="counter-container"><div class="counter-box first"><div class="number">%-D</div><span>Day%!d</span></div>' + '<div class="counter-box"><div class="number">%H</div><span>Hours</span></div>' + '<div class="counter-box"><div class="number">%M</div><span>Minutes</span></div>' + '<div class="counter-box last"><div class="number">%S</div><span>Seconds</span></div></div>'))
});
$('#counter-wedding').countdown('2015/09/20 12:00:00').on('update.countdown', function (event) {
    var $this = $(this).html(event.strftime('' + '<div class="counter-container"><div class="counter-box first"><div class="number">%-D</div><span>Day%!d</span></div>' + '<div class="counter-box"><div class="number">%H</div><span>Hours</span></div>' + '<div class="counter-box"><div class="number">%M</div><span>Minutes</span></div>' + '<div class="counter-box last"><div class="number">%S</div><span>Seconds</span></div></div>'))
});
/*==============================================================*/
//Countdown Timer - END CODE
/*==============================================================*/


/*==============================================================*/
//Scroll To Top - START CODE
/*==============================================================*/
$(window).scroll(function () {
    if ($(this)
            .scrollTop() > 100) {
        $('.scrollToTop')
                .fadeIn();
    } else {
        $('.scrollToTop')
                .fadeOut();
    }
});
//Click event to scroll to top
$('.scrollToTop').click(function () {
    $('html, body').animate({
        scrollTop: 0
    }, 1000);
    return false;
});
/*==============================================================*/
//Scroll To Top - END CODE
/*==============================================================*/
