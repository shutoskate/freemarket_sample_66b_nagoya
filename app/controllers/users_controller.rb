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

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_text)
  end
end
