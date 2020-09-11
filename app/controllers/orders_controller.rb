class OrdersController < ApplicationController

  def index
    @item = Item.find(item_params[:item_id])
  end

  def create
   
  end

  private

  def item_params
    params.permit(:name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, 
      :shippingprefecture_id, :shipping_day_id, :price, :image, :item_id).merge(user_id: current_user.id)
  end
end
