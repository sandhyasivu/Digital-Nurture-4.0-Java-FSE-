const btn = document.getElementById('findEventsBtn');
const output = document.getElementById('output');

btn.addEventListener('click', () => {
  if (!navigator.geolocation) {
    output.textContent = 'Geolocation is not supported by your browser.';
    return;
  }

  output.textContent = 'Locating… please allow location access.';

  navigator.geolocation.getCurrentPosition(success, error, {
    enableHighAccuracy: true,
    timeout: 10000,    // 10 seconds timeout
    maximumAge: 0
  });
});

function success(position) {
  const latitude  = position.coords.latitude.toFixed(6);
  const longitude = position.coords.longitude.toFixed(6);
  output.innerHTML = `
    <strong>Coordinates Found!</strong><br>
    Latitude: <span class="coords">${latitude}</span><br>
    Longitude: <span class="coords">${longitude}</span><br><br>
    <em>Use these coordinates to find the nearest community events.</em>
  `;
}

function error(err) {
  switch(err.code) {
    case err.PERMISSION_DENIED:
      output.textContent = 'Permission denied. Please allow location access to find events nearby.';
      break;
    case err.POSITION_UNAVAILABLE:
      output.textContent = 'Location information is unavailable.';
      break;
    case err.TIMEOUT:
      output.textContent = 'Request timed out. Please try again.';
      break;
    default:
      output.textContent = 'An unknown error occurred.';
      break;
  }
}
