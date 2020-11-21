class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :category ,null: false
      t.string :condition ,null: false
      t.integer :postager_payer ,null: false
      t.integer :shipping_area ,null: false
      t.string :shipping_date ,null: false
      t.timestamps
    end
  end
end