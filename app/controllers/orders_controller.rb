class OrdersController < ApplicationController

  def index
    @order =
    @item = Item.find(item_params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item@order.save
      return redirect_to root_path
    else 
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :user_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end

  def item_params
    params.permit(:name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, 
      :shippingprefecture_id, :shipping_day_id, :price, :image, :item_id).merge(user_id: current_user.id)
  end
end
