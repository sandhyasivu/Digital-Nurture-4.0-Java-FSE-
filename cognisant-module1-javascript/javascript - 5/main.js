// Event constructor function
function Event(name, date, totalSeats) {
    this.name = name;
    this.date = new Date(date);
    this.totalSeats = totalSeats;
    this.registered = 0;
}

// Adding method to prototype
Event.prototype.checkAvailability = function () {
    return this.totalSeats - this.registered > 0;
};

// Creating event instances
const event1 = new Event("Web Development Workshop", "2025-06-15", 100);
const event2 = new Event("AI Bootcamp", "2025-07-01", 50);

// Simulate registration
event1.registered = 97;
event2.registered = 50;

// Check availability
console.log(`Availability for ${event1.name}:`, event1.checkAvailability()); // true
console.log(`Availability for ${event2.name}:`, event2.checkAvailability()); // false

// List keys and values using Object.entries()
console.log("Event 1 details:");
Object.entries(event1).forEach(([key, value]) => {
    console.log(`${key}: ${value}`);
});
