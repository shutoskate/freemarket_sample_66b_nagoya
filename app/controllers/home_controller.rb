class HomeController < ApplicationController
  #before_action :authenticate_user!

  def top
  end
  
  def profile
  end

  def add_item
  end
  


  private
    def set_user
      @user = User
    end

end
