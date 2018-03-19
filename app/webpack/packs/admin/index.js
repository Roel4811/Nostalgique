import React from 'react';
import { render } from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Rails from 'rails-ujs';
// import Turbolinks from 'turbolinks';
import 'bootstrap/dist/js/bootstrap';

Rails.start();
// Turbolinks.start();

// $(function() {
//   $('#song_member_id').select2();
// });

$(document).on('turbolinks:load', function() {
  var recordTableDivHeight = $('.records-table').outerHeight(true);
  if (recordTableDivHeight <= ($(window).height() - 66)) {
    $('.side-menu').css('min-height', $(window).height() - 66+'px');
  } else {
    $('.side-menu').css('min-height', recordTableDivHeight+'px');
  }
});
