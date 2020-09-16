class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(item_params[:item_id])
    @order = UserOrder.new
    # binding.pryd
  end

  # def new
  #   @order = UserOrder.new
  # end

  def create
    # binding.pry
    @order = UserOrder.new(user_order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else 
      @item = Item.find(item_params[:item_id])
      render :index
    end
  end

  private 

  def item_params
    params.permit(:name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, 
      :prefecture_id, :shipping_day_id, :price, :image, :item_id).merge(user_id: current_user.id)
  end

  def  user_order_params
  params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(item_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: user_order_params[:token],    
      currency:'jpy'                 
    )
  end

  
end
