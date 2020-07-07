class CreateBeersFlavors < ActiveRecord::Migration[6.0]
  def change
    create_table :beers_flavors do |t|
      t.integer :flavor_id
      t.integer :beer_id

      t.timestamps
    end
  end
end
