document.getElementById("registrationForm").addEventListener("submit", function (e) {
  e.preventDefault(); 

  const form = e.target;
  const name = form.elements["name"].value.trim();
  const email = form.elements["email"].value.trim();
  const selectedEvent = form.elements["event"].value;

  document.getElementById("nameError").textContent = "";
  document.getElementById("emailError").textContent = "";
  document.getElementById("eventError").textContent = "";

  let isValid = true;

  if (name === "") {
    document.getElementById("nameError").textContent = "Name is required.";
    isValid = false;
  }

  if (email === "" || !email.includes("@")) {
    document.getElementById("emailError").textContent = "Valid email is required.";
    isValid = false;
  }

  if (selectedEvent === "") {
    document.getElementById("eventError").textContent = "Please select an event.";
    isValid = false;
  }

  if (isValid) {
    alert(`🎉 Registration Successful!\nName: ${name}\nEmail: ${email}\nEvent: ${selectedEvent}`);
    form.reset(); 
  }
});
