require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end
    it 'building_numberはなくても保存が出来る' do
      @purchase.building_number = ''
      expect(@purchase).to be_valid
    end


    it 'tokenが空だと保存できないこと' do
      @purchase.token = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeは半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase.post_code = '0001234'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid")
    end
    it 'post_codeは半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase.post_code = 'aaa-0000'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid")
    end
    it 'post_codeが空だと保存できないこと' do
      @purchase.post_code = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'shipmentが選択されていないと保存できないこと' do
      @purchase.shipment_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Shipment must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @purchase.city = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'cityは全角でないと保存できないこと' do
      @purchase.city = 'aaa'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City is invalid")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase.house_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字11以内でないと保存できないこと' do
      @purchase.phone_number = '0901234456781'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end

  end
end