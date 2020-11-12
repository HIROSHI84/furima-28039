class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.integer :price
      t.text :description 
      t.integer :category_id 
      t.integer :postage_payer_id 
      t.integer :shipping_area_id
      t.integer :shipping_date_id
      t.timestamps
    end
  end
end