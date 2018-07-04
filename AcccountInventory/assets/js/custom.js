$(document).ready(function () {

    $("#tr_1").hide();
    $("#tr_2").hide();
    $("#tr_3").hide();
    $("#tr_4").hide();
    $("#tr_5").hide();
});
var i = 0;
function addRow() {
    i++;
    $("#tr_" + i).show();
    return false;
}