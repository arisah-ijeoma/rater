$(document).ready(function() {
  $('.comments').hide();

  $('.view-rater-comments').on('click', function() {
    $('.comments').show();
    $('.pastors').hide();
    $('.view-rater-comments').hide();
  });

  $('.hide-comments').on('click', function() {
    $('.comments').hide();
    $('.view-pastors').show();
    $('.view-rater-comments').show();
  });
});
