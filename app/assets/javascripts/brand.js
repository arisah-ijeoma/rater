$(document).ready(function() {
  $('.brand-comments').hide();

  $('.view-brand-comments').on('click', function() {
    $('.brand-comments').show();
    $('.view-brand-comments').hide();
  });

  $('.hide-brand-comments').on('click', function() {
    $('.brand-comments').hide();
    $('.view-brand-comments').show();
  });
});
