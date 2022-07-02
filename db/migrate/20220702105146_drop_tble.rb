class DropTble < ActiveRecord::Migration[6.1]
  def change
    drop_table :accounts
    drop_table :users
    drop_table :messages
    drop_table :contacts
  end
end
