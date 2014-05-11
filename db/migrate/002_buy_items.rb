class BuyItemsItems < ActiveRecord::Migration
  def purchase
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.decimal :buy
	  t.decimal :total
	  t.decimal :cash
    end
  end
end