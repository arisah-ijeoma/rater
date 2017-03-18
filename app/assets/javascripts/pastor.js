$(document).ready(function() {
  $('.pastors').hide();

  $('.view-pastors').on('click', function() {
    $('.pastors').show();
    $('.view-pastors').hide();
  });

  $('.hide-pastors').on('click', function() {
    $('.pastors').hide();
    $('.view-pastors').show();
  })
});
