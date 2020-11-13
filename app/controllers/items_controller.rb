class ItemsController < ApplicationController
  before_action:authenticate_user!, only: [:new, :create]
  def index
    @items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
  end
end

private

def item_params
  params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
end
end
