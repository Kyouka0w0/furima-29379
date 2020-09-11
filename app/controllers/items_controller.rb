class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
  end

  def create
    @item = Item.new(item_params)
   if @item.valid?
     @item.save
     redirect_to root_path
   else
     render :new
   end
  end

  # def destroy
  # @item = Item.find(params[:id])
  # item.destroy
  # end
  # def edit
  # @item = item.find(params[:id])
  # end
  # def update
  # item = Item.find(params[:id])
  # item.update(item_params)
  # end
  # def show
  # @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :item_condition_id, :category_id, :price, :postage_payer_id, :shipment_id, :preparation_day_id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
