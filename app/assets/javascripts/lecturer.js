$(document).ready(function() {
  $('.lecturers').hide();

  $('.view-lecturers').on('click', function() {
    $('.lecturers').show();
    $('.view-lecturers').hide();
  });

  $('.hide-lecturers').on('click', function() {
    $('.lecturers').hide();
    $('.view-lecturers').show();
  })
});
