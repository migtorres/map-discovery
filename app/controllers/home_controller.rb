class HomeController < ApplicationController
  def index
    @countries = Country.all
    gon.countries_geo = @countries.feature_collection
  end
end
