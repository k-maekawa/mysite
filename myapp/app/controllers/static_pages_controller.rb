class StaticPagesController < ApplicationController
  def home
    @search = Property.ransack(params[:q])
    @properties = @search.result
  end

  def help
  end
end
