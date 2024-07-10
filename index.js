$(".correzioni").click(function () {
    $(this).toggleClass('active_leg');
    $("#corr").toggle();
    $("#corr").css({ "background-color": "purple", "color": "white" });
});