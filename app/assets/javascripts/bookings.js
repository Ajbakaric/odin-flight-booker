// app/assets/javascripts/bookings.js

document.addEventListener('DOMContentLoaded', function() {
    const addPassengerBtn = document.getElementById('add-passenger-btn');
    const passengersContainer = document.getElementById('passengers-container');
    const template = document.getElementById('passenger-fields-template');
  
    // Add passenger
    addPassengerBtn.addEventListener('click', function() {
      const clone = template.content.cloneNode(true);
      passengersContainer.appendChild(clone);
    });
  
    // Remove passenger
    passengersContainer.addEventListener('click', function(event) {
      if (event.target.classList.contains('remove-passenger-btn')) {
        event.preventDefault();
        if (passengersContainer.querySelectorAll('.passenger-fields').length > 1) {
          event.target.closest('.passenger-fields').remove();
        } else {
          alert("At least one set of passenger details is required.");
        }
      }
    });
  });
  