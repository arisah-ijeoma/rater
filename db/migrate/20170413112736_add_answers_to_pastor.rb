class AddAnswersToPastor < ActiveRecord::Migration
  def change
    add_column :pastors, :answer_1, :integer, null: false, default: 0
    add_column :pastors, :answer_2, :integer, null: false, default: 0
    add_column :pastors, :answer_3, :integer, null: false, default: 0
    add_column :pastors, :answer_4, :integer, null: false, default: 0
    add_column :pastors, :answer_5, :integer, null: false, default: 0
    add_column :pastors, :answer_6, :integer, null: false, default: 0
    add_column :pastors, :answer_7, :integer, null: false, default: 0
    add_column :pastors, :answer_8, :integer, null: false, default: 0
    add_column :pastors, :answer_9, :integer, null: false, default: 0
    add_column :pastors, :answer_10, :integer, null: false, default: 0
  end
end
