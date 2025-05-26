
const events = [];

//1. Add Event
function addEvent(name, date, category, seats) {
  events.push({ name, date, category, seats });
}

//2. Register User
function registerUser(eventName) {
  const event = events.find(ev => ev.name === eventName);
  if (!event) return console.error(" Event not found.");
  if (event.seats <= 0) return console.error(" No seats available.");

  event.seats--;
  console.log(` Registered for ${event.name}. Seats left: ${event.seats}`);
}

// 3. Filter Events by Category (higher-order function)
function filterEventsByCategory(category, callback) {
  const filtered = events.filter(ev => ev.category === category);
  callback(filtered);
}

//  4. Closure to track registrations by category
function createCategoryTracker(categoryName) {
  let totalRegistrations = 0;

  return function registerToCategory(eventName) {
    const event = events.find(ev => ev.name === eventName && ev.category === categoryName);
    if (!event || event.seats <= 0) {
      console.log(" Cannot register for this event.");
      return;
    }

    event.seats--;
    totalRegistrations++;
    console.log(` Registered to "${event.name}" in ${categoryName}. Total in this category: ${totalRegistrations}`);
  };
}

// Add sample events
addEvent("Tech Talk", "2025-06-15", "Technology", 5);
addEvent("Art Show", "2025-06-20", "Arts", 3);
addEvent("CodeFest", "2025-07-01", "Technology", 2);
addEvent("Yoga Session", "2025-06-25", "Wellness", 10);

// Filter events in "Technology"
filterEventsByCategory("Technology", function (list) {
  console.log("Technology Events:");
  list.forEach(ev => {
    console.log(`- ${ev.name} on ${ev.date} (${ev.seats} seats)`);
  });
});

// Use closure to track Technology registrations
const techRegister = createCategoryTracker("Technology");
techRegister("Tech Talk");   
techRegister("CodeFest");    
techRegister("Tech Talk");   
techRegister("Unknown Event"); 

