class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :status, :default => false
      t.integer :item_count
      t.float :total_price
      t.timestamps 
    end
  end
end
