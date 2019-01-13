class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :string
      t.string :owner
      t.string :string
      t.string :city
      t.string :string
      t.string :category
      t.string :string
      t.string :image
      t.string :string
      t.string :bedrooms
      t.string :integer
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
