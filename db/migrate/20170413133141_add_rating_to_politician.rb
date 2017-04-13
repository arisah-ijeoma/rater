class AddRatingToPolitician < ActiveRecord::Migration
  def change
    add_column :politicians, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :politicians, :raters, :integer, null: false, default: 0
  end
end
