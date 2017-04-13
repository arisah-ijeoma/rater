class AddAnswersToLecturer < ActiveRecord::Migration
  def change
    add_column :lecturers, :answer_1, :integer, null: false, default: 0
    add_column :lecturers, :answer_2, :integer, null: false, default: 0
    add_column :lecturers, :answer_3, :integer, null: false, default: 0
    add_column :lecturers, :answer_4, :integer, null: false, default: 0
    add_column :lecturers, :answer_5, :integer, null: false, default: 0
    add_column :lecturers, :answer_6, :integer, null: false, default: 0
    add_column :lecturers, :answer_7, :integer, null: false, default: 0
    add_column :lecturers, :answer_8, :integer, null: false, default: 0
    add_column :lecturers, :answer_9, :integer, null: false, default: 0
    add_column :lecturers, :answer_10, :integer, null: false, default: 0
  end
end
