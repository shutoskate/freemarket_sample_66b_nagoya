class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(user_params)
      render :edit
      # flash
    else
      render :edit
      # flash
    end
  end

  def mypage
    @my_trades = Trade.where(buyer_id: current_user.id)
    @my_trading_item_ids = @my_trades.map{|t| t.item_id}

    @trading_items = []
    @my_trading_item_ids.each do |i|
      if Array(Item.where(id: i,trade_step: 2)) != []
        @trading_items << Item.where(trade_step: 2).find(i)
      end
    end
    @bought_items = []
    @my_trading_item_ids.each do |i|
      if Array(Item.where(id: i,trade_step: 4)) != []
        @bought_items << Item.where(trade_step: 4).find(i)
      end
    end
  end

  def profile
  end

  def profile_update
    if current_user.update(user_params)
      redirect_to mypage_profile_path(@user)
    else
      render :profile
    end
  end

  def items
    @my_items = Item.where(seller_id: current_user.id)
    @selling_items = @my_items.where("(trade_step = ?) OR (trade_step = ?)", 1, 3).first(10)
    @trading_items = @my_items.where(trade_step: "交渉中").first(10)
    @sold_items = @my_items.where(trade_step: "売却済")
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_text)
  end
  
end
