class AddRatingToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :schools, :raters, :integer, null: false, default: 0
  end
end
