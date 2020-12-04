class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :item_image

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :item_image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :postage_payer_id, :shipping_area_id, :shipping_date_id
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
