require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録がうまくいかない時' do
      it 'nameがない場合は登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが未選択の場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'status_idが未選択の場合は登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'fee_idが未選択の場合は登録できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it 'prefectures_idが未選択の場合は登録できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "priceが299以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end
      it "priceが1000000以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end
    end
  end
end
