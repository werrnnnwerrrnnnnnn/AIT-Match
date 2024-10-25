import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
import "channels";  // Ensure all ActionCable channels are loaded

Rails.start();

// Existing turbo:load event for handling filters and sidebar toggle
document.addEventListener("turbo:load", function () {
  const showHideFilters = document.querySelector('.show-hide-filters');
  const sidebar = document.querySelector('.sidebar');

  if (showHideFilters && sidebar) {
    showHideFilters.addEventListener('click', function () {
      sidebar.classList.toggle('hidden');
    });
  }
});

import consumer from "./channels/consumer";
window.consumer = consumer;