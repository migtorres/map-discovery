var mymap = L.map('mapid').setView([47, 14], 4);
L.tileLayer('https://b.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(mymap)

var geoJSON = JSON.parse(gon.countries_geo)
L.geoJSON(geoJSON, {
  onEachFeature: function (feature, layer) {
    layer.bindPopup('<h1>'+feature.properties.name+'</h1><p>ISO3: '+
    				 feature.properties.iso_a3+'</p><p>Population: '+
    				 feature.properties.pop_est.toLocaleString()+'</p><p>GDP: '+
    				 feature.properties.gdp_md_est.toLocaleString()+' M $USD'
    				);
  }}).addTo(mymap);