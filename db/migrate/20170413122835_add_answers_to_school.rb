class AddAnswersToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :answer_1, :integer, null: false, default: 0
    add_column :schools, :answer_2, :integer, null: false, default: 0
    add_column :schools, :answer_3, :integer, null: false, default: 0
    add_column :schools, :answer_4, :integer, null: false, default: 0
    add_column :schools, :answer_5, :integer, null: false, default: 0
    add_column :schools, :answer_6, :integer, null: false, default: 0
    add_column :schools, :answer_7, :integer, null: false, default: 0
    add_column :schools, :answer_8, :integer, null: false, default: 0
    add_column :schools, :answer_9, :integer, null: false, default: 0
    add_column :schools, :answer_10, :integer, null: false, default: 0
  end
end
