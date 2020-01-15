class UsersController < ApplicationController

  def show
  end

  def new
  end

  def create
  end

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
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def profile_update
    if current_user.update(user_params)
      redirect_to mypage_profile_path(@user)
    else
      render :profile
    end
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_text)
  end
  
end
