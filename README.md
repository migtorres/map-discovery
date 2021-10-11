# Map Discovery

An app to get point information for a geojson dataset store in the database

# Dependencies

Map Discovery is a Ruby on Rails app that uses Leaflet to draw a map

# Data

Map Discovery includes a country dataset, for which it was created a model. There is no need of using Postgis as the geometries are stored as GeoJSON on the GeoJSON column.
Raw data can be 

# Users

There is a very sketchy user management system, with only admin and non-admin users.

* Admin: Can Create, Delete and Edit users and all that other users can do
* Registered user: Can create and edit countries. Can view also what the non logged user can see
* Non logged user: Can only view the map and each country factsheet.

# Install

You should have ruby 2.7.2 installed with bundler and then run:

`bundle install`


