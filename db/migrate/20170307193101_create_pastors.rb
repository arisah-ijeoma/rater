class CreatePastors < ActiveRecord::Migration
  def change
    create_table :pastors do |t|
      t.string :name
      t.string :avatar
      t.references :church

      t.timestamps null: false
    end
  end
end
