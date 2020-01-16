class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
  end

  def buy
  end

  private
  
  def item_params
    params.requier(:item).permit(:name, :size, :price, :seller_id, :brand, :category, :status, :charge, :trade_step, :delivery, :prefecture, :term)
  end

end
