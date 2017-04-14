$(document).ready(function() {
  $('.politician-comments').hide();

  $('.view-politician-comments').on('click', function() {
    $('.politician-comments').show();
    $('.view-politician-comments').hide();
  });

  $('.hide-politician-comments').on('click', function() {
    $('.politician-comments').hide();
    $('.view-politician-comments').show();
  });
});
