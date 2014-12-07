# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initialize = (myPoints) ->
    mapOptions = {
        center: { lat: 46.534343, lng: -84.332939},
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    }
       
    map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions)
    for point in myPoints
        coords = new google.maps.LatLng(point[0], point[1])
        new google.maps.Marker({
            position: coords,
            map: map,
            title: "oooo ya"
        })
    
        
        




$(document).ready ->
    points = $('#map-canvas').data('point')
    initialize(points)