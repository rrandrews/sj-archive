$(document).ready(function(){

  $('.clue.box').click(function() {
    $(this).children().toggleClass('hidden');
  });

  $('.list-group').mouseenter(function {
    $(this).addClass('active');
  });

  $('.list-group').mouseleave(function {
    $(this).removeClass('active');
  })
})
