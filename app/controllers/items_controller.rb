class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    #binding pry
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def buy
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :size, :price, :seller_id, :brand_id, :category_id, :status, :charge, :trade_step, :delivery, :prefecture, :term, :item_text).merge(seller_id:current_user.id)
  end

end
