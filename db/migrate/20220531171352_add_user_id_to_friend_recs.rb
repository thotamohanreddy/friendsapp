class AddUserIdToFriendRecs < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_recs, :user_id, :integer
    add_index :friend_recs, :user_id
  end
end
