class MapController < ApplicationController
  def view
  end

  def getheatpoints
      #2354 should get 63
      city = City.find(2354)
      pt = city.geom
      wind = Wind.where("ST_DWithin(geom, ST_GeomFromText('POINT(#{pt.x} #{pt.y})',4326), 1)").first
      
    if wind then
      @answer = wind.id
    else
      @answer = 0
    end
  end
  
  def find_within_radius(pt, dist = 0.01)
    return :conditions => "ST_DWithin(geom, ST_GeomFromText('POINT(#{pt.x} #{pt.y})', 4326), #{dist})"
  end
  
end
