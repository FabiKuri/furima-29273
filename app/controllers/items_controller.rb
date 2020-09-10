class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

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
  end

  def edit 
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

end