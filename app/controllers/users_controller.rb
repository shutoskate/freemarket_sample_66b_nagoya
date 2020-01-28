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
    @trading_items = Item.where(trade_step: "出品中").or(Item.where(trade_step: "出品停止")).where(seller_id: current_user.id).first(5)
    @sold_items = Item.where(seller_id: current_user.id, trade_step: "売却済")
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
    @items = Item.where(seller_id: current_user.id)
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_text)
  end
  
end
