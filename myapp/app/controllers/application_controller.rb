class ApplicationController < ActionController::Base
  before_action :set_search
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def set_search
    @search = Property.ransack(params[:q])
    @properties = @search.result
  end
end
