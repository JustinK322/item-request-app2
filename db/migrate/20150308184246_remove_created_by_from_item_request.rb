class RemoveCreatedByFromItemRequest < ActiveRecord::Migration
  def change
    remove_column :item_requests, :created_by, :string
  end
end
