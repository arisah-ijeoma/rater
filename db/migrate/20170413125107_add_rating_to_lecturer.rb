class AddRatingToLecturer < ActiveRecord::Migration
  def change
    add_column :lecturers, :rating, :decimal, precision: 15, scale: 2, null: false, default: 0
    add_column :lecturers, :raters, :integer, null: false, default: 0
  end
end
