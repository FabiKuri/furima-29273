require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end
      it "すべての値が正しく入力されていれば保存できること"  do
        expect(@user_order).to be_valid
      end
    it 'postalcodeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postalcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこ' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include ("City can't be blank")
    end
    it 'house_numberが空だと保存できないこ' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'buildingnameは空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it 'phonenumberが空だと保存できないこ' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phonenumberにはハイフンは不要で、11桁以内であること' do
      @user_order.phone_number = '080-1234-5678'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
