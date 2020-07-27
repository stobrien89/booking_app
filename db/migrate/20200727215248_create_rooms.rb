class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accomodates
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :tv
      t.boolean :kitchen
      t.boolean :air_conditioning
      t.boolean :heating
      t.boolean :internet
      t.integer :price
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
