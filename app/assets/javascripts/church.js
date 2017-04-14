$(document).ready(function() {
  $('.church-comments').hide();

  $('.view-church-comments').on('click', function() {
    $('.church-comments').show();
    $('.pastors').hide();
    $('.view-church-comments').hide();
  });

  $('.hide-church-comments').on('click', function() {
    $('.church-comments').hide();
    $('.view-pastors').show();
    $('.view-church-comments').show();
  });
});
