class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.float :full_price
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
