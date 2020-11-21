class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :postage_payer
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :shipping_date

    has_one_attached :image

    with_options presence: true do
    validates :name
    validates :description
    validates :price
    end

    with_options numericality: { other_than: 1 } do
        validates :category_id, :condition_id, :postage_payer_id, :shipping_area_id, :shipping_date_id
    end
end