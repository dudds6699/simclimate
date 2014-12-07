# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#starts the map options here so i can access them in other functions
#null items will be initialized


#Initializes the google maps
initialize = () ->
    mapOptions = {
        center: { lat: 40.5000, lng: -0.1167},
        zoom: 2,
        mapTypeId: google.maps.MapTypeId.SATELLITE,
        disableDoubleClickZoom: true,
        draggable: false,
        scrollwheel: false,
        panControl: false,
        disableDefaultUI: true,
        scaleControl: true
    }
    
    map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions)   

#adds points to the map        
AddPoints = (arrayPoints, map) ->
    for point in arrayPoints
        coords = new google.maps.LatLng(point[0], point[1])
        new google.maps.Marker({
            position: coords,
            map: map,
        })


CreatePointArray = (data) ->
    for d in data
        new google.maps.LatLng(d[0], d[1])
        

AddHeat = (data, map) ->
    pointArray = new google.maps.MVCArray(data)
    heatmap = new google.maps.visualization.HeatmapLayer({
        data: pointArray
    });
    heatmap.setMap(map);
    

#it starts here
$(document).ready ->
    initialPoints = $('#map-canvas').data('point')
    convertedData = CreatePointArray(initialPoints)
    
    map = initialize()
    #AddPoints(initialPoints , map)
    heat = AddHeat(convertedData, map)