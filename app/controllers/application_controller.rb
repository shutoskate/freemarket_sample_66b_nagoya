class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_categories
  protect_from_forgery with: :exception

  def set_categories
    @categories1 = Category.eager_load(children: :children).where(parent_id: nil)
  end

  private

    def production?
      Rails.env.production?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

end

