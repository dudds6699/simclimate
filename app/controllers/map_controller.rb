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
      city = City.find(2354)
      pt = city.geom
      wind = Wind.where("ST_DWithin(geom, ST_GeomFromText('POINT(#{pt.x} #{pt.y})',4326), 1)").first.geom
      
    if wind then
      @answer = wind[0]
    else
      @answer = 0
    end
    
  end
  
end
