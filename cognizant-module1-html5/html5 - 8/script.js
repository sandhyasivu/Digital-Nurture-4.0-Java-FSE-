const eventTypeSelect = document.getElementById('eventType');
const clearPrefsBtn = document.getElementById('clearPrefs');

const STORAGE_KEY = 'preferredEventType';

// Load saved preference on page load and pre-select it
window.addEventListener('DOMContentLoaded', () => {
  const savedPref = localStorage.getItem(STORAGE_KEY);
  if (savedPref) {
    eventTypeSelect.value = savedPref;
  }
});

// Save selection to localStorage whenever user changes dropdown
eventTypeSelect.addEventListener('change', () => {
  const selected = eventTypeSelect.value;
  if (selected) {
    localStorage.setItem(STORAGE_KEY, selected);
    // Also save to sessionStorage for demo (optional)
    sessionStorage.setItem(STORAGE_KEY, selected);
  }
});

// Clear preferences button functionality
clearPrefsBtn.addEventListener('click', () => {
  localStorage.removeItem(STORAGE_KEY);
  sessionStorage.removeItem(STORAGE_KEY);
  eventTypeSelect.value = '';
  alert('Your preferences have been cleared!');
});
