class AddCreatedByToItemRequests < ActiveRecord::Migration
  def change
    add_column :item_requests, :created_by, :int
  end
end
