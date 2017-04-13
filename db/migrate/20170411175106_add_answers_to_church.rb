class AddAnswersToChurch < ActiveRecord::Migration
  def change
    add_column :churches, :answer_1, :integer, null: false, default: 0
    add_column :churches, :answer_2, :integer, null: false, default: 0
    add_column :churches, :answer_3, :integer, null: false, default: 0
    add_column :churches, :answer_4, :integer, null: false, default: 0
    add_column :churches, :answer_5, :integer, null: false, default: 0
    add_column :churches, :answer_6, :integer, null: false, default: 0
    add_column :churches, :answer_7, :integer, null: false, default: 0
    add_column :churches, :answer_8, :integer, null: false, default: 0
    add_column :churches, :answer_9, :integer, null: false, default: 0
    add_column :churches, :answer_10, :integer, null: false, default: 0
  end
end
