class CreateBrandUser < ActiveRecord::Migration
  def change
    create_table :brand_users do |t|
      t.references :brand, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.decimal :rating, precision: 15, scale: 2, null: false, default: 0
    end
  end
end
