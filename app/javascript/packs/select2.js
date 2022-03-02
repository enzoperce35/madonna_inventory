$(document).ready(function() {
  $('.item-input').select2();
});

$(document).on('click', '.add_fields', function() {
  $('.item-input').select2();
});
  
$(document).on('select2:open', () => {
  document.querySelector('.select2-search__field').focus();
});
