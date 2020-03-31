$(window).scroll(function () {

    if ($(this).scrollTop() > 240) {
        $('.report-round-button').fadeOut();
    } else {
        $('.report-round-button').fadeIn();
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