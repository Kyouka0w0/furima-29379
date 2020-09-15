require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 正常
    it 'ログインしていて、必要な情報が全て揃っていたら商品を出品できる' do
      expect(@item).to be_valid
    end
    # 異常
    it '画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    it 'カテゴリーが選択されていないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態が選択されていないと出品できない' do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item condition must be other than 1')
    end
    it '発送料の負担が選択されていないと出品できない' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
    end
    it '発送元の地域の選択がされていないと出品できない' do
      @item.shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment must be other than 1')
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.preparation_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
    end
    it '販売価格が入力されていないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が300円以下だと出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格が999,999,999以上だと出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
