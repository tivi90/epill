$(window).scroll(function () {

    if ($(this).scrollTop() > 390) {
        $('.report-round-button').fadeOut();
    } else {
        $('.report-round-button').fadeIn();
    }
});

$('a[href*="#"]').on('click', function(e) {
    e.preventDefault()

    $('html, body').animate(
        {
            scrollTop: $($(this).attr('href')).offset().top,
        },
        500,
        'linear'
    )
})

$(window).scroll(function() {
    if ($(window).scrollTop() > 300) {
        $('#button_top').addClass('show');
    } else {
        $('#button_top').removeClass('show');
    }
});

$(window).scroll(function () {

    if ($(this).scrollTop() > 600) {
        $('.like-round-button').fadeOut();
    } else {
        $('.like-round-button').fadeIn();
    }
});








$(document).ready(function(){
    $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});