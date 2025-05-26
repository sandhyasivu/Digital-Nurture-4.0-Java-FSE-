const video = document.getElementById('promoVideo');
const videoStatus = document.getElementById('videoStatus');
const form = document.getElementById('eventForm');

let formChanged = false;

// oncanplay event - video is ready to play
video.oncanplay = () => {
  videoStatus.textContent = "🎬 Video ready to play!";
};

// Detect form changes to warn on unload
form.addEventListener('input', () => {
  formChanged = true;
});

// onbeforeunload event - warn if form is not submitted and user tries to leave
window.onbeforeunload = (e) => {
  if (formChanged) {
    const warningMessage = "You have unsaved changes. Are you sure you want to leave?";
    e.returnValue = warningMessage; // For most browsers
    return warningMessage;          // For some older browsers
  }
};

// Optional: On form submit, clear the flag so no warning appears
form.addEventListener('submit', (e) => {
  e.preventDefault(); // prevent actual submission for demo
  alert("Thank you for registering!");
  formChanged = false;
  form.reset();
});
