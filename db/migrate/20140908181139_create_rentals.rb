class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.text :description
      t.integer :price
      t.string :city
      t.string :state
      t.string :address
      t.integer :bedrooms
      t.attachment :rental_photo
    end
  end
end
