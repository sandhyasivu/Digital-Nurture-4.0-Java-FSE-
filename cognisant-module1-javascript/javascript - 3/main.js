
const events = [
  { name: "Tech Meetup", date: "2025-06-10", seats: 5 },
  { name: "Art Expo", date: "2024-05-10", seats: 10 }, 
  { name: "Startup Pitch", date: "2025-08-20", seats: 0 }, 
  { name: "Music Fest", date: "2025-07-05", seats: 12 }
];

const today = new Date().toISOString().split("T")[0];

console.log("🎉 Upcoming Available Events:\n");
events.forEach(event => {
                 if (event.date > today && event.seats > 0) {
    console.log(`📌 ${event.name} on ${event.date} - ${event.seats} seats`);
  } else {
    console.log(`⛔ Skipping: ${event.name} (Past or Full)`);
  }
});

function register(eventIndex) {
  try {
    const event = events[eventIndex];

         if (!event) throw new Error("Event not found.");
                           if (event.date <= today) throw new Error("Cannot register for a past event.");
    if (event.seats <= 0) throw new Error("Event is full.");

    event.seats--; 
    console.log(`✅ Registered for ${event.name}. Remaining seats: ${event.seats}`);
  } catch (err) {
    console.error(`❌ Registration failed: ${err.message}`);
  }
}
register(0); 
register(1); 
register(2); 
