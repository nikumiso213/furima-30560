class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items= Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
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
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :product_status_id, :category_id, :delivery_id, :area_id, :shipping_days_id, :price, :user).merge(user_id: current_user.id)
  end
end
