$(document).ready(function() {
  $('.pastors').hide();
  $('.pastor-comments').hide();

  $('.view-pastors').on('click', function() {
    $('.pastors').show();
    $('.view-pastors').hide();
    $('.church-comments').hide();
  });

  $('.hide-pastors').on('click', function() {
    $('.pastors').hide();
    $('.church-comments').hide();
    $('.view-pastors').show();
    $('.view-rater-comments').show();
  });

  $('#pastor_comments').on('click', function() {
    $('.pastors').hide();
    $('.pastor-comments').show();
    $('.hide-pastors').hide();
    $('.church-comments').hide();
  });

  $('.hide-pastor-comments').on('click', function() {
    $('.pastors').show();
    $('.view-pastors').hide();
    $('.church-comments').hide();
    $('.pastor-comments').hide();
    $('.hide-pastors').show();
  })
});
