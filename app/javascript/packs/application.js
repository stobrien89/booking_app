// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");
window.jQuery = $;
window.$ = $;
require("bootstrap");
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.min.css");
document.addEventListener("turbolinks:load", () => {
  flatpickr(".datepicker", {
    altInput: true,
    dateFormat: "d-m-Y",
  });

  $(".owl-carousel").owlCarousel({
    loop: true,
    margin: 10,
    responsive: {
      0: {
        items: 2,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 5,
      },
    },
  });
});
require("raty-js");
require("geocomplete");
require("webpack-jquery-ui/css");
require("webpack-jquery-ui/slider");
require("owl.carousel");
require("owl.carousel/dist/assets/owl.carousel.css");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const imagePath = (name) => images(name, true)
