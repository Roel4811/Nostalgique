"use strict";

$(function () {
  var navbar_links = document.querySelectorAll("ul.nav.navbar-nav li");

  navbar_links.forEach(function (link) {
    link.addEventListener("click", function (e) {
      removeActive(navbar_links);
      e.target.classList.add("active");
    });
  });
});

function removeActive(links) {
  links.forEach(function (link) {
    link.classList.remove("active");
  });
}
