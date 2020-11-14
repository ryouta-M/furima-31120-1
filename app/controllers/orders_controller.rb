class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  def index 
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
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
  params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number)
  .merge(user_id: params[:user_id], item_id: params[:item_id], token: params[:card_token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  item = Item.find(order_params[:item_id])
  Payjp::Charge.create(
    amount: item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end

def move_to_index
  redirect_to root_path if current_user.id == @item.user_id || item.order != nil
end