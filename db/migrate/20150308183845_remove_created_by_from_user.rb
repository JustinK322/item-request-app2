class RemoveCreatedByFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :created_by, :string
  end
end
