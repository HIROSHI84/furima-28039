require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it 'item_image,name,description,category_id,condition_id,postage_payer_id,shipping_area_id,shipping_date_id,priceが正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end

      it '価格は３００円以上であれば、保存できること' do
        @item = build(:item)
        @item.price = 300
      end
    end

    context '商品出品ができない時' do
      it '画像は１枚必須であること' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end

      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end

      it '配送料の負担についての情報が必須であること' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Postage payer must be other than 1'
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping area must be other than 1'
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping date must be other than 1'
      end

      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが、¥300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it 'priceが、¥9,999,999を超過すると保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters.'
      end
    end
  end
end
