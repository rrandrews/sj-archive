var sjUI = {

  init: function() {
    $('.order').blur(sjUI.updateOrder);
    $('.clue-edit').click(sjUI.autofillOrder);
    $(sjUI.toggler).click(sjUI.toggle);
  },

  container: '.toggle-container',
  toggler: '.toggler',
  togglee: '.togglee',
  classToToggle: 'hidden',

  // Toggles toggle_class for all togglee elements in container class.
  // If data-target is present, the collection of togglees is narrowed to allow
  // for multiple indepentent togglers in one container.
  toggle: function() {
      var togglee = sjUI.togglee;
      if ($(this).data('target')) {
        togglee += '.' + $(this).data('target');
      }
      var togglees = $(this).closest(sjUI.container).find(togglee);
      togglees.toggleClass(sjUI.classToToggle);
  },

  lastOrder: 0,

  // Autofill order box when moving to a new clue in editor
  autofillOrder: function() {
    var nextOrderBox = $(this).closest('.edit-box').find('.order');
    console.log(nextOrderBox);
    if (!nextOrderBox.val()) {
      sjUI.lastOrder += 1;
      if (sjUI.lastOrder > 24) sjUI.lastorder = 1;
      nextOrderBox.val(sjUI.lastOrder);
    }
  },
  // update order for autofill if order manually changed
  updateOrder: function() {
    sjUI.lastOrder = parseInt($(this).val());
  }

};

$(document).ready(function () {
    resetContestants();
    // var lastOrder = 0;
    // $('.order').blur(function() {
    //   lastOrder = parseInt($(this).val());
    // });

    // $('.clue-edit').focus(function () {
    //   nextOrderBox = $(this).parent().next().next().find('.order');
    //   if (!nextOrderBox.val()) {
    //     lastOrder += 1;
    //     if (lastOrder > 24) lastOrder = 1;
    //     nextOrderBox.val(lastOrder);
    //   }
    // });+

    // $('.toggler').click(sjUI.toggle);

    sjUI.init();

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
          $(this).children().eq(i).val($('.contestants').eq(i).val());
          $(this).children().eq(i).text($('.contestants option:selected').eq(i).text());
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
