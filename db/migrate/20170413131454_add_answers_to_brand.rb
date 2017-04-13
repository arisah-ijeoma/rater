class AddAnswersToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :answer_1, :integer, null: false, default: 0
    add_column :brands, :answer_2, :integer, null: false, default: 0
    add_column :brands, :answer_3, :integer, null: false, default: 0
    add_column :brands, :answer_4, :integer, null: false, default: 0
    add_column :brands, :answer_5, :integer, null: false, default: 0
    add_column :brands, :answer_6, :integer, null: false, default: 0
    add_column :brands, :answer_7, :integer, null: false, default: 0
    add_column :brands, :answer_8, :integer, null: false, default: 0
    add_column :brands, :answer_9, :integer, null: false, default: 0
    add_column :brands, :answer_10, :integer, null: false, default: 0
  end
end
