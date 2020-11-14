class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order(id: 'DESC')
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

  def show
  end

  def edit
    redirect_to root_path and return unless set_item.order.nil?
  end

  def update
    @item.update(item_params)
    render action: :edit and return unless @item.valid?

    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end