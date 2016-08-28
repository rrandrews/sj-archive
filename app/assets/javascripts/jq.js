$(document).on('turbolinks:load', function() {
    $('.clue.box').click(function() {
      $(this).find(".clue-body").children().toggleClass('hidden');
    });

    $('.link-attachment').click(function(event) {
      $(this).parent().parent().children(".attachment").toggleClass('hidden');
      event.preventDefault();
    });

    $('.show-response').click(function(event) {
      $(this).next().toggleClass('hidden');
      event.preventDefault();
    })
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
    });
});
