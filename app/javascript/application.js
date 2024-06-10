// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Add a click event listener to the "Add passenger" button
document.addEventListener('turbo:load', () => {
    const addPassengerBtn = document.getElementById('add-passenger-btn');
    if (addPassengerBtn) {
      addPassengerBtn.addEventListener('click', () => {
        // Add your logic to add new passenger fields here
        const passengersContainer = document.getElementById('passengers-container');
        const template = document.getElementById('passenger-fields-template').innerHTML;
        passengersContainer.insertAdjacentHTML('beforeend', template);
      });
    }
  });

  // Add a click event listener to all "Remove" buttons
document.addEventListener('turbo:load', () => {
    const removeButtons = document.querySelectorAll('.remove-passenger-btn');
    removeButtons.forEach(button => {
      button.addEventListener('click', () => {
        // Find the parent element of the button (e.g., the passenger container)
        const passengerContainer = button.closest('.passenger-fields');
        // Remove the parent element from the DOM
        passengerContainer.remove();
      });
    });
  });
  