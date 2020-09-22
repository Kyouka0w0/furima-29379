class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_item, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :present_item, only: [:index]


  def index
    @order = Purchase.new
  end

  def create
    @order = Purchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :post_code, :shipment_id, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_59f7591c17ee52874c7aa27e"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    else
    end
   end
   
   def present_item
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    else
    end
  end
end
