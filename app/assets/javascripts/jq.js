$(document).ready(function () {

    resetContestants();
    var lastOrder = 0;
    $('.order').blur(function() {
      lastOrder = parseInt($(this).val());
    });

    $('.clue-edit').focus(function () {
      nextOrderBox = $(this).parent().next().next().find('.order');
      if (!nextOrderBox.val()) {
        lastOrder += 1;
        nextOrderBox.val(lastOrder);
      }
    });

    $('.clue.box').click(function() {
      $(this).find(".clue-body").children().toggleClass('hidden');
    });

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

    var previous;
    $('.contestants').on('focus', function() {
      previous = this.value;
    }).change(function() {
      updateContestants(previous, this.value, $('option:selected', this).text(),
                        $(this).data('index'));
      previous = this.value;
    });


    function updateContestants(previous_value, new_value, new_label, index) {
      $('.response-contestant').each(function() {
        $update = $(this).children().eq(index - 1);
        $update.val(new_value);
        $update.text(new_label);
      });
    }

    function resetContestants () {
      $('.response-contestant').each(function() {
        for (i = 0; i < 3; i++) {
          $(this).children().eq(i).val($('.contestants').children().eq(i).val());
          $(this).children().eq(i).text($('.contestants').children().eq(i).text());
        }
      })
    }

  var target = document.querySelector('body');
  var config = {childList: true, subtree: true};

  var observer = new MutationObserver(function( mutations ) {
    mutations.forEach(function(mutation) {
      list = $(mutation.addedNodes).find('.response-contestant');
      console.log(mutation.target);
      list.empty();
      $('.contestants').each(function() {
        new_item = '<option value="' + $(this).val() + '">' +
                    $('option:selected', this).text() + '</option>';
        list.append(new_item);
      });

      console.log(mutation.type);
    });
  });

  observer.observe(target, config);
});
