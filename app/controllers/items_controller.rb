class ItemsController < ApplicationController
  # # before_action :authenticate_user!
  # before_action :move_to_index, expect: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end

    # @item = Item.creaate(content: params[:price], checked: false)
    # render json:{ price: price}
  end

  # def checked
  #   item = Item.find(params[:price])
  #   if item.checked
  #     item.update(checked: false)
  #   else
  #     post.update(checked: true)
  #   end

  #   post = Item.find(params[:price])
  #   render json: [ item: post]
  # end

  private

  def item_params
    params.require(:item).permit(:name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, 
      :shippingprefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end




  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: index
  #   end
  # end
end