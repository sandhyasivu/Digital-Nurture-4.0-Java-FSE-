document.getElementById("registrationForm").addEventListener("submit", function (e) {
  e.preventDefault();

  const form = e.target;
  const name = form.elements["name"].value.trim();
  const email = form.elements["email"].value.trim();
  const selectedEvent = form.elements["event"].value;

  
  clearErrors();
  let isValid = validateForm(name, email, selectedEvent);

  if (isValid) {
    const userData = {
      name,
      email,
      event: selectedEvent
    };


    console.log(" Sending data to server...");
    setTimeout(() => {
      fetch("https://jsonplaceholder.typicode.com/posts", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(userData)
      })
      .then(response => {
        if (!response.ok) throw new Error("Network error");
        return response.json();
      })
      .then(data => {
        console.log(" Registration successful!", data);
        alert("🎉 Successfully registered for " + selectedEvent);
        form.reset();
      })
      .catch(error => {
        console.error("submission failed:", error);
        alert(" Failed to register. Please try again later.");
      });
    }, 1500); 
  }
});

function validateForm(name, email, event) {
  let valid = true;

  if (name === "") {
    document.getElementById("nameError").textContent = "Name is required.";
    valid = false;
  }

  if (!/^\S+@\S+\.\S+$/.test(email)) {
    document.getElementById("emailError").textContent = "Enter a valid email.";
    valid = false;
  }

  if (event === "") {
    document.getElementById("eventError").textContent = "Select an event.";
    valid = false;
  }

  return valid;
}

function clearErrors() {
  document.getElementById("nameError").textContent = "";
  document.getElementById("emailError").textContent = "";
  document.getElementById("eventError").textContent = "";
}
