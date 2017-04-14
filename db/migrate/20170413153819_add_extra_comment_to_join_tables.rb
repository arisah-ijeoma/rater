class AddExtraCommentToJoinTables < ActiveRecord::Migration
  def change
    add_column :church_users, :extra_comment, :text
    add_column :pastor_users, :extra_comment, :text
    add_column :school_users, :extra_comment, :text
    add_column :lecturer_users, :extra_comment, :text
    add_column :brand_users, :extra_comment, :text
    add_column :politician_users, :extra_comment, :text
  end
end
