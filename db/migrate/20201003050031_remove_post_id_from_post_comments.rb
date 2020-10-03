class RemovePostIdFromPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :post_id, :integer
  end
end
