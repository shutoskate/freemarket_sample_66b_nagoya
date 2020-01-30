class HomeController < ApplicationController
  
  def top
    @ladies_items = get_items(1)
    @mens_items = get_items(2)
    @camera_items = get_items(8)
    @hobys_items = get_items(6)
    @popular_categories = [@ladies_items, @mens_items, @camera_items, @hobys_items]

    # アイテムから、ブランドidごとに集計して、上位四つのブランドidと数の配列を取得
    @listed_items = Item.where(trade_step: "出品中")
    @brand_list = @listed_items.group(:brand_id).count.sort_by{|k,v| v}.reverse.first(4)
    @popular_brands = @brand_list.map {|item| item[0]}
    @brands1_items = @listed_items.where(brand_id: @popular_brands[0]).last(10).reverse
    @brands2_items = @listed_items.where(brand_id: @popular_brands[1]).last(10).reverse
    @brands3_items = @listed_items.where(brand_id: @popular_brands[2]).last(10).reverse
    @brands4_items = @listed_items.where(brand_id: @popular_brands[3]).last(10).reverse
    @popular_brand_items = [@brands1_items, @brands2_items, @brands3_items, @brands4_items]

  end

  private
  def get_items(category_id)
    @category = Category.eager_load(children: :children).find(category_id)
    @categories = [
      @category.children,
      @category.children.map { |category| category.children }
    ].flatten.compact
    @items_category = []
    @categories.each do |category|
      @items_category << (Item.where(trade_step: "出品中").where(category_id: category.id).compact)
      @items_category = @items_category.delete_if(&:empty?)
    end
    @items_category = @items_category.flatten.sort.reverse
  end
end