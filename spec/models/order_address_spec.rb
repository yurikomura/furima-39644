require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    #user = FactoryBot.create(:user)
    #item = FactoryBot.create(:item, user_id: user.id)
    #@order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報の保存ができるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列であれば保存できる' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it '都道府県が「--」以外であれば保存できる' do
        @order_address.prefecture_id = 1
        expect(@order_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_address.city = '東京都'
        expect(@order_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_address.addresses = '1-1'
        expect(@order_address).to be_valid
      end
      it '電話番号が10桁以上11桁以内の半角数値であれば保存できる' do
        @order_address.phone_number = 12_345_678_910
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_address.item_id = 1
        expect(@order_address).to be_valid
      end
    end
    context '商品購入情報の保存できないとき' do
      it '郵便番号が空だと保存できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_address.post_code = 1_123_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が「--」だと保存できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank", "City 全角文字を使用してください")
      end
      it '番地が空でだと保存できない' do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だとと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_address.phone_number = "123-4567-8910"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上あると保存できない' do
        @order_address.phone_number = "123_4567_8910_123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
