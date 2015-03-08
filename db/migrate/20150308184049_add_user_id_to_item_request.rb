class AddUserIdToItemRequest < ActiveRecord::Migration
  def change
    add_column :item_requests, :user_id, :int
  end
end
