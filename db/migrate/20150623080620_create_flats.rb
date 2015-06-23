class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :address_numberstreet
      t.integer :address_zip
      t.string :address_city
      t.string :address_state
      t.string :address_country
      t.integer :night_price
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
