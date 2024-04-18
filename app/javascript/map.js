function initMap() {
  // Show map
  map = new google.maps.Map(document.getElementById('map'), {
    // Map options
    center: { lat: 35.6803997, lng: 139.7690174 },
    zoom: 12,
  });
}

// Search
function search() {
  initMap();
  const formData = new FormData(document.getElementById("detailed-search-form"));

  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/search", true);

  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  XHR.setRequestHeader('X-CSRF-Token', csrfToken);
  XHR.responseType = "json";

  //send search data
  XHR.send(formData); 
  //if sent data successfully, call below.
  XHR.onload = () => {
    const markerData = XHR.response.markers;
    // Add marker
    markerData.forEach(data => {
      const marker = new google.maps.Marker({
        position: { lat: data.lat, lng: data.lng },
        map: map
      });
      const contentStore = `
      <div>
        <div>店舗名：${data.store_name}</div>
        <div>住所：${data.address}</div>
        <div>営業時間：${data.opening_hours}</div>
        <div>店舗説明：${data.description}</div>
      </div>
      `;

      //Create infoWindow
      const infoWindow = new google.maps.InfoWindow({
        // Set contentStore as infoWindow
        content: contentStore
      });

      google.maps.event.addListener(marker, 'click', () => {
        infoWindow.open(map, marker);
      });
    });
  };
};

document.getElementById("detailed-search-form").addEventListener("submit", function(event) {
  event.preventDefault();
  search();
});

document.getElementById("search-submit").addEventListener("click", function(event) {
  event.preventDefault();
  search();
});
