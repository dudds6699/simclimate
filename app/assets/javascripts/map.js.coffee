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
    
    @map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions)   

#adds points to the map        
AddPoints = (arrayPoints, map) ->
    for point in arrayPoints
        coords = new google.maps.LatLng(point[0], point[1])
        new google.maps.Marker({
            position: coords,
            map: map,
        })



        
@map = {}        


    
@HeatMapArray = []

@CitiesArray = []

@ClimateCitiesArray = []

@StartingYear = 2010
@EndingYear = 2012


@initailizeCities = (data) ->
    for i in data
        {
            coords: [i.coords[0], i.coords[1]],
            co2: i.co2 == null ? 0 : i.co2
        }
        
@createHeatMap = (data) ->
    points = CreatePointArray(data)
    pointArray = new google.maps.MVCArray(points)
    heatmap = new google.maps.visualization.HeatmapLayer({
        data: pointArray
    })

@CreatePointArray = (data) ->
    for d in data
        new google.maps.LatLng(d.coords[0], d.coords[1])


@AddHeat = (heatmap) ->
    heatmap.setMap(@map);

@RemoveHeat = (heatmap) ->
    heatmap.setMap(null)    

#it starts here
$(document).ready ->
    $('#play').data('year', EndingYear - StartingYear)
    start()
    $('#calculate').on( 'click', () ->
        calculate()
    )
    $('#play').on('click', () ->
        playSim()
    )

@years = [".one", ".two", ".three", ".four", ".five"]    
    
@start= () ->    
    initialPoints = $('#map-canvas').data('point')
    CitiesArray = initailizeCities(initialPoints)
    HeatMapArray.push(createHeatMap(CitiesArray))
    
    ClimateCitiesArray.push(CitiesArray)
    
    @map = initialize()
    
    #initalize the map
    heats = AddHeat(HeatMapArray[0], map)
    
    StartingYear = StartingYear + 1
    
    
 

            
calculate = () ->
    $('#play').hide()
    end = EndingYear - StartingYear
    recalculate = this.ClimateCitiesArray[0]
    recalculateCall(recalculate, @years[0])
    $('#play').data('score', 0)
    
    
             
    
recalculateCall = (collection, cssClass) ->
    for it in collection
        request = $.get '/map/movethepoints?y=' + it.coords[0] + "&x=" + it.coords[1] , (data) ->
            page = $(cssClass).data('storage')
            page = [] if page == null || page == "" || page == undefined
            page.push(data)
            $(cssClass).data('storage', page)
            data
    
            
            
playSim = () ->
    newPointArray = initailizeCities( $('.store').data('storage'))
    
    end = EndingYear - StartingYear
    if newPointArray != undefined then HeatMapArray.push(createHeatMap(newPointArray))
    
    $('.store').each( () ->
        gp = initailizeCities($(this).data('storage'))
        HeatMapArray.push(createHeatMap(gp))
    )
    
    
    
    
    for i in HeatMapArray
        RemoveHeat(i)
        
    for h in HeatMapArray
            AddHeat(h)
        
       

        
$(document).ajaxComplete () ->
        tscore = $('#play').data('score')
        years = [".one", ".two", ".three", ".four", ".five"] 
        
        check = $(years[tscore]).data('storage')
        if (tscore != 5 && check != null && check != "" && check.length == 2487)
            tscore = tscore + 1
            $('#play').data('score', tscore)
            recalculateCall($(years[tscore - 1]).data('storage'), years[tscore])
        else if tscore == 5
            $('#play').show()    
            
        
        
        
    
        
    