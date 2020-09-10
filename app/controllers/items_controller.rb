class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
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
end
