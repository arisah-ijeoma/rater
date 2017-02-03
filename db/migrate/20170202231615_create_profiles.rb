class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :profile_picture
      t.string :profession
      t.string :course_of_study
      t.text :brief
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end