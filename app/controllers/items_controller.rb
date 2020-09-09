class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
  end

  def checked
    item = Item.find(params[:price])
    if item.checked
      item.update(checked: false)
    else
      post.update(checked: true)
    end

    post = Item.find(params[:price])
    render json: [ item: post]
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, 
      :shippingprefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end