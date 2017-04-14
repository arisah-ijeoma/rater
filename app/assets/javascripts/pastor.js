$(document).ready(function() {
  $('.pastors').hide();

  $('.view-pastors').on('click', function() {
    $('.pastors').show();
    $('.view-pastors').hide();
    $('.comments').hide();
  });

  $('.hide-pastors').on('click', function() {
    $('.pastors').hide();
    $('.comments').hide();
    $('.view-pastors').show();
    $('.view-rater-comments').show();
  })
});
