$(() =>
  initializeMap()
)

initializeMap = () ->
  mapStyles = [
    "elementType": "geometry",
    "stylers": [
        { "hue": "#005eff" },
        { "visibility": "on" },
        { "lightness": 18 }
      ]
  ]
  
  styledMap = new google.maps.StyledMapType mapStyles,
    name: 'jacobsHack Map'
  
  mapOptions = 
    zoom: 16,
    center: new google.maps.LatLng(53.166890, 8.650116),
    disableDefaultUI: true
  
  map = new google.maps.Map document.getElementById('map'), mapOptions
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
  
  jubMarker = new google.maps.Marker
    position: new google.maps.LatLng(53.168237, 8.650521),
    map: map,
    title: "jacobsHack! at Jacobs University Bremen"
    
  google.maps.event.addListener jubMarker, 'click', () ->
    window.open "https://www.google.ie/maps/place/Jacobs+University+IRC,+Jacobs+University+Bremen,+Campus+Ring+1,+28759+Bremen,+Germany/@53.168237,8.650521,18z/data=!4m7!1m4!3m3!1s0x0:0x0!2zNTPCsDEwJzA1LjciTiA4wrAzOScwMS45IkU!3b1!3m1!1s0x47b12ca189108299:0x68806e1d530b2b1d?hl=en","_blank"
  
  