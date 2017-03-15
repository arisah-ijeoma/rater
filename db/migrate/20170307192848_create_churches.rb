class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :aka
      t.string :date_founded
      t.string :founder
      t.string :website
      t.string :avatar

      t.timestamps null: false
    end
  end
end
