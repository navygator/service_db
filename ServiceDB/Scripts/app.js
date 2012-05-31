$(document).ready(function () {
    $("#checkUserName").bind("click", function () {
        var username = $("#username").valueOf();
        $("#check_username").load("/Account/CheckUsername?username=" = username);
    })
});