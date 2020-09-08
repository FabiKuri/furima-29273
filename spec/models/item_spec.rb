require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample.jpg')
    end
    it "imageが空だと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと保存できない" do
      @item.name = nil
      @item.valid?

      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "contentが空だと保存できない" do             
      @item.content = nil                
      @item.valid?             
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it "genreの説明が空だと保存できない"  do
      @item.genre_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre can't be blank")
    end
    it "itemdetailが空だと保存できない"  do
      @item.itemdetail_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Itemdetail can't be blank")
    end
    it "shippingdetailが空だと保存できない"  do
      @item.shippingdetail_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shippingdetail can't be blank")
    end
    it "shippingprefectureを選択していないと保存できないこと" do
      @item.shippingprefecture_id = nil
      # binding./ry
      @item.valid?
      expect(@item.errors.full_messages).to include("Shippingprefecture can't be blank")
    end
    it "shippingDayが空だと保存できない"  do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it "priceが空だと保存できない"  do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end
