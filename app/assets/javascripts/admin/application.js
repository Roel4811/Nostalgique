//= require jquery3
//= require jquery_ujs
//= require select2
//= require select2
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $('#song_member_id').select2();

});

$(document).on('turbolinks:load', function() {
  var recordTableDivHeight = $('.records-table').outerHeight(true);
  if (recordTableDivHeight <= ($(window).height() - 66)) {
    $('.side-menu').css('min-height', $(window).height() - 66+'px');
  } else {
    $('.side-menu').css('min-height', recordTableDivHeight+'px');
  }
});
