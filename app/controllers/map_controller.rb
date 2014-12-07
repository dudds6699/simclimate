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
          points << { :coords => [point.y, point.x], :co2 => 3 }
      end
      
      @answer = points.to_json
      

  end
  
  def movethepoints
    #2354 should get 63
      pwr = 0.25
    
      pt = City.find(2354).geom
      wind = Wind.where("ST_DWithin(geom, ST_GeomFromText('POINT(#{pt.x} #{pt.y})',4326), 1)").first.geom[0]
      
      wStartPT = wind.start_point
      wEndPT = wind.end_point
      
      
      
      wAdd = [(wEndPT.y - wStartPT.y) * pwr,  (wEndPT.x - wStartPT.x) * pwr] 
      pMove = [(pt.y + wAdd[0]) , (pt.x + wAdd[1])]
     
      @answer = [[pt.y, pt.x] , pMove].to_json
  end
  
end
