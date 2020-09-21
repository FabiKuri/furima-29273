class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

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
    if @item.update(item_params)
       redirect_to item_path
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end