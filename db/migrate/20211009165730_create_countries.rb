class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :sovereignt
      t.string :state_type
      t.string :admin
      t.string :name
      t.string :name_long
      t.string :abbrev
      t.string :formal_en
      t.integer :pop_est
      t.float :gdp_md_est
      t.integer :pop_year
      t.integer :gdp_year
      t.string :economy
      t.string :income_grp
      t.string :iso_a2
      t.string :iso_a3
      t.string :geojson

      t.timestamps
    end
  end
end
