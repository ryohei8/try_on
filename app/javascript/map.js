var map; 
var marker = []
function initMap() {
  // Show map
  var map = new google.maps.Map(document.getElementById('map'), {
    // Map options
    center: { lat: 35.6803997, lng: 139.7690174 },
    zoom: 12,
  });
  }

window.onload = function() {
initMap()
}