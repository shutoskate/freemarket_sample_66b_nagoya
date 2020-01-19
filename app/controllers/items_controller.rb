class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :buy, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy, :buy]
  require 'enumerize'

  def index
  end

  def show
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
    # 開発終わればsave!をsaveに戻す
    if @item.save!
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def buy
    @address = Address.find_by(user_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :size, :price, :seller_id, :brand_id, :category_id, :status, :charge, :trade_step, :delivery, :prefecture, :term, :item_text).merge(seller_id:current_user.id)
  end

end
