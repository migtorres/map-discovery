class Country < ApplicationRecord

  def self.feature_collection
    features = []

    find_each { |f| features << JSON.parse(f.as_geojson) }

    "{\"type\":\"FeatureCollection\",\"features\":#{features.to_json}}"
  end

  def as_geojson
    properties = as_json.except("created_at", "updated_at", "geojson").delete_if{|k,v| v.nil?}

    "{\"type\":\"Feature\",\"geometry\":#{geojson.squish},\"properties\":#{properties.to_json}}"
  end

end
