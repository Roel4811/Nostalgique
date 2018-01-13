$(function(){
  const navbar_links = document.querySelectorAll("ul.nav.navbar-nav li");

  navbar_links.forEach(link => {
    link.addEventListener("click", (e) => {
      removeActive(navbar_links);
      e.target.classList.add("active");
    });
  });
});

function removeActive(links) {
  links.forEach(link => {
    link.classList.remove("active");
  });
}
