const events = [
  { name: "Music Fest", category: "music", seats: 3 },
  { name: "AI Workshop", category: "tech", seats: 2 },
  { name: "Baking Class", category: "cooking", seats: 5 }
];

//  Clone event list using spread operator
const clonedEvents = [...events];

// Function using default parameters + destructuring
function renderEvents(eventList = []) {
  const container = document.querySelector("#eventsContainer");
  container.innerHTML = "";

  eventList.forEach(({ name, category, seats }) => {
    const card = document.createElement("div");
    card.className = "event-card";
    card.innerHTML = `
      <h3>${name}</h3>
      <p>Category: ${category}</p>
      <p>Available Seats: ${seats}</p>
    `;
    container.appendChild(card);
  });
}

// Filter music events from cloned list
const musicEvents = clonedEvents.filter(e => e.category === "music");

// Render filtered events
renderEvents(musicEvents);
