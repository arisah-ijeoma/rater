class CreateUserPoliticianHearts < ActiveRecord::Migration
  def change
    create_table :user_politician_hearts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :politician, index: true, foreign_key: true
      t.boolean :like, default: false, null: false

      t.timestamps null: false
    end
  end
end
