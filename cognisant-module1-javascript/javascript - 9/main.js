const eventsContainer = document.getElementById("eventsContainer");
const loader = document.getElementById("loader");

// Mock API function (simulated async data fetch)
function fetchEventsFromAPI() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const data = [
        { name: "Music Fest", category: "music", seats: 5 },
        { name: "Tech Talk", category: "tech", seats: 2 },
        { name: "Dance Class", category: "art", seats: 0 }
      ];
      resolve(data);
      // To simulate error: use reject("Error fetching data");
    }, 2000); // 2 seconds delay
  });
}

// Render event cards
function renderEvents(events) {
  eventsContainer.innerHTML = "";
  events.forEach(event => {
    const card = document.createElement("div");
    card.className = "event-card";
    card.innerHTML = `
      <h3>${event.name}</h3>
      <p>Category: ${event.category}</p>
      <p>Available Seats: ${event.seats}</p>
    `;
    eventsContainer.appendChild(card);
  });
}

// --- Version 1: Using .then() and .catch()
/*
fetchEventsFromAPI()
  .then(events => {
    loader.style.display = "none";
    renderEvents(events);
  })
  .catch(error => {
    loader.textContent = "Failed to load events.";
    console.error(error);
  });
*/

// --- Version 2: Using async/await
async function loadEvents() {
  try {
    const events = await fetchEventsFromAPI();
    loader.style.display = "none";
    renderEvents(events);
  } catch (error) {
    loader.textContent = "Failed to load events.";
    console.error(error);
  }
}

loadEvents();
