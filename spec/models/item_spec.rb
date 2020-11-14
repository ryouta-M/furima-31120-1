require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '#create' do
    context '商品出品成功'do
      it '全ての情報が存在すれば出品できる'do
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら出品できる'do
        @item.price = 1234
        expect(@item).to be_valid
      end
      it 'priceが300~9,999,999であれば出品できる'do
        @item.price = 398
        expect(@item).to be_valid
      end
      it 'prefecture_idが1以外なら出品できる'do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it 'preparation_day_idが1以外なら出品できる'do
        @item.preparation_day_id = 2
        expect(@item).to be_valid
      end
    end

    context '商品出品失敗'do
      it 'titleが空だと出品できない'do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空だと出品できない'do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空だと出品できない'do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと出品できない'do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000円以上だと出品できない'do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字以外だと出品できない'do
        @item.price = '９０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが空だと出品できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが1だと出品できない'do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'prefecture_idが1だと出品できない'do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'condition_idが1だと保存できない'do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'postage_payer_idが1だと保存できない'do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end
      it 'preparation_day_idが1だと出品できない'do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
      end
    end
  end
end
