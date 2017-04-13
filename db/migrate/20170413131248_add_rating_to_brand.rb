class AddRatingToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :brands, :raters, :integer, null: false, default: 0
  end
end
