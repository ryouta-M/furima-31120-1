require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '注文情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての情報が正しく入力されていれば保存される' do
      expect(@order_address).to be_valid
    end
    it '郵便番号がないと保存できない'do
    @order_address.post_code = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない'do
      @order_address.post_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid')
    end
    it '電話番号がないと保存できない'do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると保存できない'do
      @order_address.phone_number = '111-1111-1111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は11文字以内でないと保存できない'do
      @order_address.phone_number = '1111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '都道府県が選択されてないと保存できない'do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it '市区町村が存在しないと保存できない'do
    @order_address.city = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が存在しないと保存できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'tokenが存在しないと保存できない'do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end