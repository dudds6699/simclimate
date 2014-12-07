class MapController < ApplicationController
  def view
  end

  def getheatpoints
      #2354 should get 63
      #city = City.find(2354)
      city = City.all
      points = []
      
      city.each do |item|
          point = item.geom
          points << [point.y, point.x]
      end
      
      @answer = points.to_json
      

  end
  
  def movethepoints
    #2354 should get 63
      pt = City.find(2354).geom
      wind = Wind.where("ST_DWithin(geom, ST_GeomFromText('POINT(#{pt.x} #{pt.y})',4326), 1)").first.geom[0]
      
      wStartPT = wind.start_point
      wEndPT = wind.end_point
      
      
      
     
      @answer = [[pt.y, pt.x] , wVector].to_json
  end
  
end
