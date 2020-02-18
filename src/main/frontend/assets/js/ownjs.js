$(window).scroll(function () {

    if ($(this).scrollTop() > 40) {
        $('.report-round-button').fadeOut();
    } else {
        $('.report-round-button').fadeIn();
    }
});

