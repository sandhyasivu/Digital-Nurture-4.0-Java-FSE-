// Event data
let events = [
  { name: "Music Fest", category: "music", seats: 3 },
  { name: "AI Workshop", category: "tech", seats: 2 },
  { name: "Baking Class", category: "cooking", seats: 1 },
  { name: "Jazz Night", category: "music", seats: 0 }
];

// DOM references
const container = document.querySelector("#eventsContainer");
const categoryFilter = document.querySelector("#categoryFilter");
const searchBox = document.querySelector("#searchBox");

// Render events dynamically
function renderEvents(filtered = events) {
  container.innerHTML = "";

  filtered.forEach((event, index) => {
    const card = document.createElement("div");
    card.className = "event-card";

    card.innerHTML = `
      <h3>${event.name}</h3>
      <p>Category: ${event.category}</p>
      <p>Available Seats: <span id="seats-${index}">${event.seats}</span></p>
    `;

    const registerBtn = document.createElement("button");
    registerBtn.textContent = "Register";
    registerBtn.onclick = () => {
      if (events[index].seats > 0) {
        events[index].seats--;
        document.querySelector(`#seats-${index}`).textContent = events[index].seats;
      } else {
        alert("No seats available!");
      }
    };

    card.appendChild(registerBtn);
    container.appendChild(card);
  });
}

// Filter by category
categoryFilter.onchange = () => {
  const selected = categoryFilter.value;
  const filtered = selected === "all" ? events : events.filter(e => e.category === selected);
  renderEvents(filtered);
};

// Search by name (keydown event)
searchBox.addEventListener("keydown", () => {
  const query = searchBox.value.toLowerCase();
  const filtered = events.filter(e => e.name.toLowerCase().includes(query));
  renderEvents(filtered);
});

// Initial render
renderEvents();
