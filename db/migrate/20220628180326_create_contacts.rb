class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :sender
      t.integer :receiver
      t.string :name
      t.timestamps
    end
  end
end
