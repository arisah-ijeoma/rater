$(function () {
  $(window).on("resize", function (e) {
    var w = e.target.innerWidth;
    var input = $("#search_bar");
    return input.attr("placeholder", (w > 1 && w < 770) ? "anything..." : "schools, churches, politics, brands...")
  }).resize()
});
