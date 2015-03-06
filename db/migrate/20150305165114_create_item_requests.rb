class CreateItemRequests < ActiveRecord::Migration
  def change
    create_table :item_requests do |t|
      t.string :itemName
      t.text :reason
      t.decimal :price
      t.boolean :isApproved
      t.integer :approvedBy
      t.datetime :approvedOn

      t.timestamps
    end
  end
end
