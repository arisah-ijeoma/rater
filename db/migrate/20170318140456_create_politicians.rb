class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :current_office
      t.datetime :date_assumed
      t.string :present_party
      t.string :former_position
      t.string :avatar

      t.timestamps null: false
    end
  end
end
