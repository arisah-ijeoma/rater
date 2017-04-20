class ChangeHearts < ActiveRecord::Migration
  def change
    rename_table :hearts, :user_church_hearts
    add_column :user_church_hearts, :like, :boolean, default: false, null: false
  end
end
