require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "必要な情報、nickname〜bithdayまでがきちんと存在すれば登録できること" do

    end

    it "nameが空では登録できないこと" do

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
    it "nameが空では登録できないこと" do

    end
  end
end