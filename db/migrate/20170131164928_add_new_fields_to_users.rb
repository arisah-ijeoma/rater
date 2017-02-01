class AddNewFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :state_of_origin, :string
    add_column :users, :state_of_residence, :string
    add_column :users, :account_type, :string, null: false, default: 'Anonymous'
  end
end
