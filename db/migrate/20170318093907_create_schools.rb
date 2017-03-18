class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :aka
      t.string :date_founded
      t.string :location
      t.string :ownership
      t.string :category
      t.string :head
      t.string :website
      t.string :avatar

      t.timestamps null: false
    end
  end
end
