class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :course
      t.string :avatar
      t.references :school

      t.timestamps null: false
    end
  end
end
