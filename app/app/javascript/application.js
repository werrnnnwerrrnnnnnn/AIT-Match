import "@hotwired/turbo-rails"; // Turbo for handling page loads
import "controllers"; // Import Stimulus controllers
import "channels"; // Ensure all ActionCable channels are loaded

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

import consumer from "./channels/consumer"; // Import ActionCable consumer
window.consumer = consumer; // Make it globally accessible