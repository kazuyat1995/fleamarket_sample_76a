class ChangeDatatypeCommentOfComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :comment, :text
  end
end
