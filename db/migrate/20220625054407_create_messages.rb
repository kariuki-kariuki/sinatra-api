class CreateMessages < ActiveRecord::Migration[6.1]
  def change 
    create_table :messages do |t|
      t.string :text_massage
      t.integer :sender
      t.integer :receiver
      t.string :typ
      t.timestamps
    end
  end
end
