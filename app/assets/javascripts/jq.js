$(document).ready(function(){

  $('.clue.box').click(function() {
    $(this).children().toggleClass('hidden');
  });

  $('.link-attachment').click(function(event) {
    $(this).parent().parent().children(".attachment").toggleClass('hidden');
  });

  $('.image-link').click(function(event) {
    img = $(this).data('link');
    $('.modal').css('display', 'block');
    $('.modal-content').attr("src", img);
    $('.caption').text($(this).parent().text());
    //event.preventDefault();
    return false;
  });


  $('.close').click(function(event) {
    $('.modal').css('display', 'none');
  });

  $('.modal-content').click(function() {
    $('.modal').css('display', 'none');
  })

})
