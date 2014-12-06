class HomeController < ApplicationController
  def index
      @test = RGeo::GeoJSON.encode(Wind.first().geom)
  end

  def about
  end

  def faq
  end
end
