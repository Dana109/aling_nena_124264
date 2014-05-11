class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.integer :sold
	  t.integer :bought
	  t.decimal :total
    end
  end
end
