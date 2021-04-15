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
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end
      it "priceが1000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end
      it "画像がない場合は登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
      it "商品説明がない場合は登録できない" do
        @item.description = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "値段が半角英数混合では登録できない" do
        @item.price = "aAbBcC012"
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
      it "値段が半角英数だけでは登録できない" do
        @item.price = "abcdefg"
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
      it "day_idが未選択の場合は登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
    end
  end
end
