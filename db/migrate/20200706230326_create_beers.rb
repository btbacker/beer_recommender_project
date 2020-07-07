class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :country
      t.float :abv
      t.integer :ibu

      t.timestamps
    end
  end
end
