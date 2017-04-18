$(document).ready(function() {
  $('.school-comments').hide();

  $('.view-school-comments').on('click', function() {
    $('.school-comments').show();
    $('.lecturers').hide();
    $('.view-school-comments').hide();
    $('.lecturer-comments').hide();
  });

  $('.hide-school-comments').on('click', function() {
    $('.school-comments').hide();
    $('.view-lecturers').show();
    $('.view-school-comments').show();
  });
});
