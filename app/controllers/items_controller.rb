class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items= Item.all.order(created_at: :desc)
  end

  def show
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
