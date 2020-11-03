class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  before_action :move_to_index, only: [:index]

  def index
    @order = UserOrder.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(amount: @item.price, card: order_params[:token], currency: 'jpy')
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end

end