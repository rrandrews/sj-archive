$(document).on('turbolinks:load', function() {
    $('.clue.box').click(function() {
      $(this).find(".clue-body").children().toggleClass('hidden');
    });

    var toggleHidden = function(target) {
      alert(target);
    };

    $('.toggle-hidden').click(function(event) {
      target = "." + $(this).data("target");
      $(this).parent().parent().children(target).toggleClass('hidden');
      event.preventDefault();
    });

    $('.show-response').click(function(event) {
      $(this).next().toggleClass('hidden');
      event.preventDefault();
    })

    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    }); 

});
