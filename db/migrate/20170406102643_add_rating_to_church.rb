class AddRatingToChurch < ActiveRecord::Migration
  def change
    add_column :churches, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :churches, :raters, :integer, null: false, default: 0
  end
end
