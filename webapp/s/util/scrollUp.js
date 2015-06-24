;
(function ($) {
    $.scrollUp = function (options) {
        var settings = {
            scrollName: "scrollUp",
            topDistance: "300",
            topSpeed: 300,
            animation: "fade",
            animationInSpeed: 200,
            animationOutSpeed: 200,
            scrollText: "返回顶部",
            activeOverlay: false
        };
        if (options)var settings = $.extend(settings, options);
        var sn = "#" + settings.scrollName, an = settings.animation, os = settings.animationOutSpeed, is = settings.animationInSpeed, td = settings.topDistance, st = settings.scrollText, ts = settings.topSpeed, ao = settings.activeOverlay;
        $("<a/>", {
            id: settings.scrollName,
            href: "#top", title: st, text: st
        }).appendTo("body");
        $(sn).css({"display": "none", "position": "fixed", "z-index": "2147483647"});
        if (ao) {
            $("body").append("<div id='" + settings.scrollName + "-active'></div>");
            $(sn + "-active").css({
                "position": "absolute",
                "top": td + "px",
                "width": "100%",
                "border-top": "1px dotted " + ao,
                "z-index": "2147483647"
            })
        }
        $(window).scroll(function () {
            if (an === "fade")$($(window).scrollTop() > td ? $(sn).fadeIn(is) : $(sn).fadeOut(os)); else if (an === "slide")$($(window).scrollTop() > td ? $(sn).slideDown(is) : $(sn).slideUp(os));
            else $($(window).scrollTop() > td ? $(sn).show(0) : $(sn).hide(0))
        });
        $(sn).click(function (event) {
            $("html, body").animate({scrollTop: 0}, ts);
            return false
        })
    }
})(jQuery);

$(function () {
    $.scrollUp();
});

/* 全部参数 */
/*
 $(function () {
 $.scrollUp({
 scrollName: 'scrollUp', // Element ID
 topDistance: '300', // Distance from top before showing element (px)
 topSpeed: 300, // Speed back to top (ms)
 animation: 'fade', // Fade, slide, none
 animationInSpeed: 200, // Animation in speed (ms)
 animationOutSpeed: 200, // Animation out speed (ms)
 scrollText: 'Scroll to top', // Text for element
 activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
 });
 });
 */
