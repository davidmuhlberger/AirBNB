class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :flat, index: true, foreign_key: true
      t.integer :guests
      t.date :check_in
      t.date :check_out
      t.string :status
      t.string :message

      t.timestamps null: false
    end
  end
end
