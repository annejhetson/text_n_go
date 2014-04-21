$(document).ready(function(){
  $('.clickmessage').click(function() {
    $('.longmessage').hide();
    $('.shortmessage').show();
    $(this).children('.longmessage').show();
    $(this).children('.shortmessage').hide();

  });
});
