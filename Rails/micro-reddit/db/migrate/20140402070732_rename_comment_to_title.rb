class RenameCommentToTitle < ActiveRecord::Migration
  def change
  	rename_column :posts, :comment, :title
  end
end
