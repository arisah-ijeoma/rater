class AddRatingToPastor < ActiveRecord::Migration
  def change
    add_column :pastors, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :pastors, :raters, :integer, null: false, default: 0
  end
end
