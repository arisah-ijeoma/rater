$(function () {
 var placeholder = function(className) {
    $(window).on("resize", function (e) {
      var w = e.target.innerWidth;
      var input = $(className);
      return input.attr("placeholder", (w > 1 && w < 770) ? "anything..." : "search for schools, churches, politics, brands...")
    }).resize();
  };

  placeholder('#search_bar');
  placeholder('#header_search_bar');

  var resultsForSearch = $('.search-results');

  resultsForSearch.hide();

  if(/[?&]q=/.test(location.search)) {
    $('.search').hide();
    resultsForSearch.show();
  }
});
