class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :item_name
      t.integer :phone
      t.float :price
      t.integer :item_id
      t.string :business_name
      t.string :image
      t.string :description
      t.timestamps
    end
  end
end
