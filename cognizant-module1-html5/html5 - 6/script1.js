// Get elements
const phoneInput = document.getElementById('phone');
const phoneError = document.getElementById('phoneError');
const eventSelect = document.getElementById('eventSelect');
const feeDisplay = document.getElementById('eventFee');
const feedback = document.getElementById('feedback');
const charCount = document.getElementById('charCount');
const confirmation = document.getElementById('confirmation');
const submitBtn = document.getElementById('submitBtn');
const eventImage = document.getElementById('eventImage');

console.log("All elements loaded.");

// Validate phone on blur
phoneInput.addEventListener('blur', () => {
  const phoneValue = phoneInput.value.trim();
  const phoneRegex = /^[0-9]{10}$/;

  console.log("Phone blur event triggered with value:", phoneValue);

  if (!phoneRegex.test(phoneValue)) {
    phoneError.textContent = "Please enter a valid 10-digit phone number.";
    phoneInput.style.borderColor = '#e74c3c';
  } else {
    phoneError.textContent = "";
    phoneInput.style.borderColor = '#2980b9';
  }
});

// Show event fee on change
eventSelect.addEventListener('change', () => {
  console.log("Event dropdown changed.");

  if (eventSelect.value) {
    const selectedOption = eventSelect.options[eventSelect.selectedIndex];
    const fee = selectedOption.getAttribute('data-fee');
    console.log("Selected event fee:", fee);
    feeDisplay.textContent = `Event Fee: ₹${fee}`;
  } else {
    feeDisplay.textContent = "";
  }
});

// Count characters in feedback textarea
feedback.addEventListener('keyup', () => {
  const length = feedback.value.length;
  charCount.textContent = `Characters typed: ${length} / 250`;
  console.log("Key typed in feedback. Length:", length);
});

// Submit button click
submitBtn.addEventListener('click', () => {
  debugger; // Chrome DevTools will pause here for debugging

  const phoneValue = phoneInput.value.trim();
  const phoneRegex = /^[0-9]{10}$/;
  console.log("Submit clicked. Phone value:", phoneValue);

  if (!phoneRegex.test(phoneValue)) {
    phoneError.textContent = "Please enter a valid 10-digit phone number before submitting.";
    phoneInput.style.borderColor = '#e74c3c';
    confirmation.textContent = "";
    return;
  }

  if (!eventSelect.value) {
    confirmation.style.color = '#e74c3c';
    confirmation.textContent = "Please select an event before submitting.";
    return;
  }

  confirmation.style.color = '#27ae60';
  confirmation.textContent = "Thank you for your feedback! Your input has been recorded.";
  console.log("Feedback submitted successfully.");
});

// Double-click to enlarge image
eventImage.addEventListener('dblclick', () => {
  eventImage.classList.toggle('enlarged');
  console.log("Image was double-clicked. Enlarged:", eventImage.classList.contains('enlarged'));
});
