require "test_helper"

class CountryTest < ActiveSupport::TestCase
  test "#as_geojson shows item as geojson feature" do
    multipolygon = '{"type":"MultiPolygon","coordinates":[[[[0,0],[0,1],[1,1],[1,0],[0,0]]]]}'
    country = FactoryBot.create(:country, geojson: multipolygon)

    result = "{\"type\":\"Feature\",\"geometry\":{\"type\":\"MultiPolygon\",\"coordinates\":[[[[0,0],[0,1],[1,1],[1,0],[0,0]]]]},
               \"properties\":{\"id\":#{country.id},\"name\":\"#{country.name}\",\"iso_a3\":\"#{country.iso_a3}\"}}".squish.gsub(/\s+/, "")

    assert_equal result, country.as_geojson
  end

  test ".festure_collection shows all items as geojson feature collection" do
    multipolygon = '{"type":"MultiPolygon","coordinates":[[[[0,0],[0,1],[1,1],[1,0],[0,0]]]]}'
    country = FactoryBot.create(:country, geojson: multipolygon)

    result = "{\"type\":\"FeatureCollection\",\"features\":[{\"type\": \"Feature\", \"geometry\": {\"type\":\"MultiPolygon\",\"coordinates\":[[[[0,0],[0,1],[1,1],[1,0],[0,0]]]]},
               \"properties\":{\"id\":#{country.id},\"name\":\"#{country.name}\",\"iso_a3\":\"#{country.iso_a3}\"}}]}".squish.gsub(/\s+/, "")


    assert_equal result, Country.feature_collection
  end
end
