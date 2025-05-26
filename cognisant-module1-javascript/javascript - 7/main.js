// Sample event data
let events = [
    { name: "Music Fest", category: "music", seats: 5 },
    { name: "AI Workshop", category: "tech", seats: 2 },
    { name: "Baking Class", category: "cooking", seats: 0 }
];

// Access container
const container = document.querySelector("#events-container");

// Function to render events
function renderEvents() {
    container.innerHTML = ""; // clear old content

    events.forEach((event, index) => {
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

        const cancelBtn = document.createElement("button");
        cancelBtn.textContent = "Cancel";
        cancelBtn.onclick = () => {
            events[index].seats++;
            document.querySelector(`#seats-${index}`).textContent = events[index].seats;
        };

        card.appendChild(registerBtn);
        card.appendChild(cancelBtn);

        container.appendChild(card);
    });
}

// Initial render
renderEvents();
