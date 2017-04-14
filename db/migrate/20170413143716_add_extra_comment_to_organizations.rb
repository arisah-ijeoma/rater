class AddExtraCommentToOrganizations < ActiveRecord::Migration
  def change
    add_column :churches, :extra_comment, :text
    add_column :pastors, :extra_comment, :text
    add_column :schools, :extra_comment, :text
    add_column :lecturers, :extra_comment, :text
    add_column :brands, :extra_comment, :text
    add_column :politicians, :extra_comment, :text
  end
end
