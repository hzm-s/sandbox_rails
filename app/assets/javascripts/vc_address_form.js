$(document).on('turbolinks:load', function() {
  $('[data-behavior="submit-vc-addresses"]').on('click', function(e) {
    $('.js-vc-address-form').each(function(i, el) {
      Rails.fire(el, 'submit');
    });
  });
});
