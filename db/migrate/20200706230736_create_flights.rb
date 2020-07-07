class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :beer_id
      t.integer :order_id

      t.timestamps
    end
  end
end
