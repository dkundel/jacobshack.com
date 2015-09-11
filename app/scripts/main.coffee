$(() =>
  initializeMap()
  
  $(window).scroll scrollSpy
  
  $('.applybtn').click openApply
  
  $('#kungFury').click goToPortal
  
  attachFaqListener()
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
    mapTypeControl: false,
    scrollwheel:false,
    navigationControl: false,
    streetViewControl: false,
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


currentSection = '';
scrollSpy = (evt) ->
  topView = $(window).scrollTop() + (window.innerHeight - 150);
  $('.section-title').each () ->
    offsetTop = $(this).offset().top
    if topView > offsetTop then $(this).addClass('active') else $(this).removeClass('active')
    
    
attachFaqListener = () ->
  $('.faq-nav-entry').each () ->
    $link = $(this)
    $link.click () ->
      $('.faq-nav-entry.active').removeClass('active')
      $link.addClass('active')
      $('.faq-category.active').removeClass('active')
      $($link.find('a').attr('href')).addClass('active')
      true
      
      
openApply = () ->
  $kungFury = $('#kungFury')
  $boardGif = $('#boardgif')
  $codingGif = $('#codinggif')
  $loading = $('#loading')
  $loadingBar = $('.loading-entry')
  
  $kungFury.show 'scale'
  setTimeout () ->
    $codingGif.hide()
    $loading.show()
    $loadingBar.width 400
    setTimeout () ->
      goToPortal()
    , 3000
  , 2000
  
  
goToPortal = () ->
  window.location.href='https://my.jacobshack.com/';
  # $('#portalLink')[0].click()
  # $('#kungFury').hide()
  # $('#codinggif').show()
  # $('.loading-entry').width 0
  # $('#loading').hide()