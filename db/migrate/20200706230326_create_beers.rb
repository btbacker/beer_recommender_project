class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :beer_name
      t.string :brewery
      t.string :beer_style
      t.string :beer_description
      t.string :country
      t.float :abv
      t.integer :ibu
      t.string :beer_image
      t.string :brewery_city
      t.string :brewery_region
      t.integer :brewery_active
      t.float :brewery_latitude
      t.float :brewery_longitude

      t.timestamps
    end
  end
end