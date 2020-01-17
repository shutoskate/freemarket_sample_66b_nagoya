class ItemsController < ApplicationController
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
    @brand = Brand.find(@item.brand_id)
    @user = User.find(@item.seller_id)
    # 以下、imgテーブル作成次第表示----------------
    # @img = Item_imag.find(item_id: params[:id])
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
