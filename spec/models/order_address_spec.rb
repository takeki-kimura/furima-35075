require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 0.1
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '内容に問題がない場合' do
      it "全ての値が正しく入力されていれば保存できること" do
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it "postal_codeが空では保存ができないこと" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがなければ保存ができないこと" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefectures_idが未選択では保存ができないこと" do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "cityが空では保存ができないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "numberが空では保存ができないこと" do
        @order_address.number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it "tokenがないと登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "電話番号が空だと保存できないこと" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号に数字以外があると保存できないこと" do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号に英字が混ざっていると保存できないこと" do
        @order_address.phone_number = "090123a567z"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が11桁を超えると保存できないこと" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end