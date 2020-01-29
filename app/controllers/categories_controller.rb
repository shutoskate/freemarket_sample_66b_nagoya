class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil)
  end
  def show
    @category = Category.find(params[:id])
    if @category.parent_id == nil
      @categories = [
        @category.children,
        @category.children.map { |category| category.children }
      ].flatten.compact
    elsif @category.children == nil
      @categories = @category
    else 
      @categories = [
        @category,
        @category.children
      ].flatten.compact
    end
    @items = @categories.map{|category| Item.where(trade_step: "出品中").or(Item.where(trade_step: "売却済")).where(category_id: category.id)}.flatten
  end
end