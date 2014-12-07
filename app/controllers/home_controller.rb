class HomeController < ApplicationController
  def index
      #arrg = SpCall.new
      #@test = Util.get_date
      #arrg.fetch_val_from_sp("exec sayname 'arrrgh'")
      #RGeo::GeoJSON.encode(Wind.first().geom)
      @test = City.first.geom
  end

  def about
  end

  def faq
  end
end
