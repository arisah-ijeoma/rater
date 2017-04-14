$(document).ready(function() {
  $('.lecturers').hide();
  $('.lecturer-comments').hide();

  $('.view-lecturers').on('click', function() {
    $('.lecturers').show();
    $('.view-lecturers').hide();
  });

  $('.hide-lecturers').on('click', function() {
    $('.lecturers').hide();
    $('.view-lecturers').show();
  });

  $('#lecturer_comments').on('click', function() {
    $('.lecturers').hide();
    $('.lecturer-comments').show();
    $('.hide-lecturers').hide();
  });

  $('.hide-lecturer-comments').on('click', function() {
    $('.lecturers').show();
    $('.view-lecturers').hide();
    $('.school-comments').hide();
    $('.lecturer-comments').hide();
    $('.hide-lecturers').show();
  })
});
