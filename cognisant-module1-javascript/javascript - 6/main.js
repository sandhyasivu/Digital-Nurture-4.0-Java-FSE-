// Initial array of community events
let events = [
    { name: "Music Fest", category: "music" },
    { name: "AI Workshop", category: "tech" },
    { name: "Baking Class", category: "cooking" }
];

// 1. Add new events using .push()
events.push(
    { name: "Guitar Night", category: "music" },
    { name: "Photography Basics", category: "art" }
);

console.log("All Events:", events);

// 2. Filter only music events
const musicEvents = events.filter(event => event.category === "music");
console.log("Music Events:", musicEvents);

// 3. Format display using .map()
const eventCards = events.map(event => `Workshop on ${event.name}`);
console.log("Event Display Cards:", eventCards);
