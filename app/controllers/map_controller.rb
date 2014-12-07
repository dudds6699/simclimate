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
          points << { :coords => [point.y, point.x], :co2 => item.data_2010 }
      end
      
      @answer = points.to_json
      

  end
  
  def movethepoints
    #2354 should get 63
      pwr = 1
    
      x = params[:x].to_f
      y = params[:y].to_f
      wind = Wind.where("ST_DWithin(geom, ST_GeomFromText('POINT(#{x} #{y})',4326), 1)").first
      
    if wind then
        wind = wind.geom[0]
      
        wStartPT = wind.start_point
        wEndPT = wind.end_point
      
      
      
        wAdd = [(wEndPT.y - wStartPT.y) * pwr,  (wEndPT.x - wStartPT.x) * pwr] 
        pMove = [(y + wAdd[0]) , (x + wAdd[1])]
        render :json => {:coords => pMove}
    else
     render :json => {:coords => [y, x]}
    end
      
  end
  
end
