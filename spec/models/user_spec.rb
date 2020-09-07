require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "必要な情報、nickname〜bithdayまでがきちんと存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end
    it "first_nameが空では登録できないこと" do

    end
    it "last_nameが空では登録できないこと" do

    end
    it "first_name_kanaが空では登録できないこと" do

    end
    it "last_name_kanaが空では登録できないこと" do

    end
    it "birthdayが空では登録できないこと" do

    end
  end
end