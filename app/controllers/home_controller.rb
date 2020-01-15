class HomeController < ApplicationController
  #before_action :authenticate_user!

  def top
  end
  
  def profile
  end
  


  private
    def set_user
      @user = User
    end

end
