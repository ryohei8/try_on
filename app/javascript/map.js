var map; 
var marker = []

function initMap() {
  // Show map
  map = new google.maps.Map(document.getElementById('map'), {
    // Map options
    center: { lat: 35.6803997, lng: 139.7690174 },
    zoom: 12,
  });
  }

function search(){
  const form = document.getElementById("detailed-search-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/search", true);

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    XHR.setRequestHeader('X-CSRF-Token', csrfToken);
    XHR.responseType = "json";

    //send search data
    XHR.send(formData); 
    //if sent data successfully, call below.
    XHR.onload = () => {
      const response = XHR.response;
      const markerData = response.markers;
      console.log(response)
      // Add marker
      markerData.forEach(data => {
        new google.maps.Marker({
          position: { lat: data.lat, lng: data.lng },
          map: map
        });
      });
    };
  });
};



document.addEventListener('turbo:load', function() {
  initMap();
  search()
});
