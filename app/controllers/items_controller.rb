class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    params.require(:item).permit(:name, :introduction, :item_condition_id, :category_id, :price, :postage_payer_id, :shipment_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end

end
