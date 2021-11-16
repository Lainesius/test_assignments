var events = document.getElementsByClassName("event_header");
var i;

for (i = 0; i < events.length; i++) {
  events[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var event_body = this.nextElementSibling;
    if (event_body.style.display === "block") {
      event_body.style.display = "none";
    } else {
      event_body.style.display = "block";
    }
    });
}
