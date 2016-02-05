var loaded = function(){

  $(document).ready(function() {
    $('.modal-trigger').leanModal();
    $(".button-collapse").sideNav();

    var $chips = $('.chip');

    $('#name_search_name').keyup('change', function () {
    var currentName = this.value;
    $chips.each(function (index, chip) {
      $chip = $(chip);
      if ($chip.data('name').includes(currentName)) {
        $chip.show();
      } else {
        $chip.hide();
      }
    });
  });
  });
}

$(document).on("page:load ready", loaded);
