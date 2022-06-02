class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.float :lat
      t.float :long
      t.text :display_name
      t.string :address_place
      t.string :house_no
      t.string :road
      t.string :suburb
      t.string :city
      t.string :county
      t.string :state
      t.string :postcode
      t.string :country
      t.string :country_code
      t.text :boundingbox, array: true, default: []

      t.timestamps
    end
  end
end
