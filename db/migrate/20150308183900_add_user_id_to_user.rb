class AddUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :int
  end
end
