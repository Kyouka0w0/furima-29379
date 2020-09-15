require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    #正常
    it 'ログインしていて、必要な情報が全て揃っていたら商品を出品できる' do
      
      #expect(@item.user).to be_valid
    end
    #異常
    it 'ログインしていないと、商品出品画面に遷移することができない' do

      #@item.user = nil
      #@item.valid?
      #expect(current_path).to eq root_path

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
    it '' do

    end
  end
end