class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :managed_by
      t.string :industry
      t.string :avatar

      t.timestamps null: false
    end
  end
end
