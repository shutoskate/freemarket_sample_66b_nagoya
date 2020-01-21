class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :buy, :edit, :update, :destroy,]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :stop, :start]
  require 'enumerize'

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
    @item.item_imgs.new
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

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
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

  def stop
    @item.update_attribute(:trade_step, "出品停止")
    redirect_to @item
  end

  def start
    @item.update_attribute(:trade_step, "出品中")
    redirect_to @item
  end

  # def change
  #   if @item.trade_step = "出品中"
  #     @item.update_attribute(:trade_step, "出品停止")
  #     # binding.pry
  #   elsif @item.trade_step = "出品停止"
  #     @item.update_attribute(:trade_step, "出品中")
  #     # binding.pry
  #   else
  #     render :show
  #   end
  #   redirect_to @item
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def change_params
    params.require(:item).permit(:trade_step)
  end
  
  def item_params
    params.require(:item).permit(:name, :size, :price, :seller_id, :brand_id, :category_id, :status, :charge, :trade_step, :delivery, :prefecture, :term, :item_text, item_imgs_attributes: [:img, :_destroy, :id]).merge(seller_id:current_user.id)
  end


end
