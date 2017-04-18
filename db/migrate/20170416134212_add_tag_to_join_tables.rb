class AddTagToJoinTables < ActiveRecord::Migration
  def change
    add_column :churches, :tag, :string
    add_column :pastors, :tag, :string
    add_column :schools, :tag, :string
    add_column :lecturers, :tag, :string
    add_column :brands, :tag, :string
    add_column :politicians, :tag, :string
  end
end
