class CreateUserLecturerHearts < ActiveRecord::Migration
  def change
    create_table :user_lecturer_hearts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lecturer, index: true, foreign_key: true
      t.boolean :like, default: false, null: false

      t.timestamps null: false
    end
  end
end
