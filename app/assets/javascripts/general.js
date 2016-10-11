const General = {
  sideMenu: function () {
    $('#menuTrigger').on('click', function () {
      $('.sidebar.menu').sidebar('toggle')
    })
  },

  initMap: function () {
    var map;
    map = new google.maps.Map(document.getElementById('googlemaps'), {
      center: {lat: -34.397, lng: 150.644},
      zoom: 8
    });
  }
}

General.sideMenu();
General.initMap();
