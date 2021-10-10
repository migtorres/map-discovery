FactoryBot.define do
  factory :country do
  	name { "iuciania" }
    iso_a3 { "IUC" }
    geojson { '{"type":"MultiPolygon","coordinates":[[[[0,0],[0,1],[1,1],[1,0],[0,0]]]]}' }
  end
end