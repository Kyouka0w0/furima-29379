class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    @purchase.save
    @order = Order.new(price: order_params[:price])
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
    params.reqire(:purchase).permit(:price, :token, :post_code, :prefecture_code_id, :city, :house_number, :building_number, :phone_number, :order_id)
  end

  def pay_item
    Payjp.api_key = "pk_test_69e5c83d059b46439cd162e2"
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
