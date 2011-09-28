class ChangeColumnNameReplies < ActiveRecord::Migration
  def self.up
    rename_column :replies, :comments_id, :comment_id
  end

  def self.down
    rename_column :replies, :comment_id, :comments_id
  end
end
