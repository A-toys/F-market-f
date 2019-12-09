$(document).ready(function() {
  if(location.pathname != "/") {
      $('.nav li a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('active');
  } else $('.nav li a:eq(0)').addClass('active');
});