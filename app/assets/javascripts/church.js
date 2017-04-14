$(document).ready(function() {
  $('.church-comments').hide();

  $('.view-rater-comments').on('click', function() {
    $('.church-comments').show();
    $('.pastors').hide();
    $('.view-rater-comments').hide();
  });

  $('.hide-church-comments').on('click', function() {
    $('.church-comments').hide();
    $('.view-pastors').show();
    $('.view-rater-comments').show();
  });
});
