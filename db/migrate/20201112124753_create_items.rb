class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user  
      t.string :name                , null: false
      t.integer :price              , null: false
      t.text :description           , null: false
      t.integer :category_id        , null: false
      t.integer :condition_id       , null: false
      t.integer :postage_payer_id   , null: false
      t.integer :shipping_area_id   , null: false
      t.integer :shipping_date_id   , null: false
      t.timestamps
    end
  end
end