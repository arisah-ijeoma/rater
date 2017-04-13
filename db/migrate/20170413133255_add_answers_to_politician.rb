class AddAnswersToPolitician < ActiveRecord::Migration
  def change
    add_column :politicians, :answer_1, :integer, null: false, default: 0
    add_column :politicians, :answer_2, :integer, null: false, default: 0
    add_column :politicians, :answer_3, :integer, null: false, default: 0
    add_column :politicians, :answer_4, :integer, null: false, default: 0
    add_column :politicians, :answer_5, :integer, null: false, default: 0
    add_column :politicians, :answer_6, :integer, null: false, default: 0
    add_column :politicians, :answer_7, :integer, null: false, default: 0
    add_column :politicians, :answer_8, :integer, null: false, default: 0
    add_column :politicians, :answer_9, :integer, null: false, default: 0
    add_column :politicians, :answer_10, :integer, null: false, default: 0
  end
end
