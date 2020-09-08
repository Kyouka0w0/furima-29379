class UsersController < ApplicationController
  
   def index
     @users = User.all
   end

   def new
   end

   def create
     @user = User.new(user_params)
    #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @user.valid?
       @user.save
      redirect_to root_path
    else
       #保存されなければ、newに戻る
       render 'new'
    end
   end
   private
   def user_params
     params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
   end
end
