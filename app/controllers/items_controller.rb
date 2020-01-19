class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :buy]
  require 'enumerize'

  def index
  end

  def show
    @item = Item.find(params[:id])
    if Category.find(@item.category_id).parent.parent
      @subsubcategory = Category.find(@item.category_id)
      @subcategory = @subsubcategory.parent
      @category = @subcategory.parent
    else
      @subcategory = Category.find(@item.category_id)
      @category = @subcategory.parent
    end
    @brand = Brand.find(@item.brand_id_before_type_cast)
    @user = User.find(@item.seller_id)
    # 以下、imgテーブル作成次第表示----------------
    # @img = Item_imag.find(item_id: params[:id])

  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    #binding pry
    # 開発終わればsave!をsaveに戻す
    if @item.save!
      redirect_to @item
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
