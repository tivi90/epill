$(window).scroll(function () {

    if ($(this).scrollTop() > 390) {
        $('.report-round-button').fadeOut();
    } else {
        $('.report-round-button').fadeIn();
    }
});

$(window).scroll(function () {

    if ($(this).scrollTop() > 600) {
        $('.like-round-button').fadeOut();
    } else {
        $('.like-round-button').fadeIn();
    }
});




$(window).on('beforeunload', function(){
    $(window).scrollTop(0);
});




$(document).ready(function(){
    $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});