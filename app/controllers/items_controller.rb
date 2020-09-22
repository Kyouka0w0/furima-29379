class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :edit_item, only: [:edit]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :item_condition_id, :category_id, :price, :postage_payer_id, :shipment_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_item
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def order_item
    @order = Order.find(params[:item_id])
  end
end
