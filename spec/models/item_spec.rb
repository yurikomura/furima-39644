require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録ができる場合' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it '商品画像があれば登録できる' do
        expect(@item).to be_valid
      end

      it '商品名があれば登録できる' do
        @item.name = '商品名'
        expect(@item).to be_valid
      end

      it '商品説明があれば登録できる' do
        @item.info = '商品説明'
        expect(@item).to be_valid
      end

      it 'カテゴリーが「--」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end

      it '商品の状態が「--」以外であれば登録できる' do
        @item.sales_status_id = 1
        expect(@item).to be_valid
      end

      it '配送料の負担が「--」以外であれば登録できる' do
        @item.shipping_fee_status_id = 1
        expect(@item).to be_valid
      end

      it '配送元の地域が「--」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end

      it '発送までの日数が「--」以外であれば登録できる' do
        @item.scheduled_delivery_id = 1
        expect(@item).to be_valid
      end

      it '価格が半角数字かつ300円～9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品登録ができない場合' do
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '1枚商品画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料の負担が空では出品できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '配送元の地域が空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300円未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10,000,000円を超過すると保存できないこと' do
        @item.price = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 10000000")
      end

      it 'カテゴリーが「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が「---」だと出品できない' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料の負担が「---」だと出品できない' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '配送元の地域が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が「---」だと出品できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end  

    end
  end
end



