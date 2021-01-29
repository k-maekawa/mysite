class PropertiesController < ApplicationController
  def show
    @property = Property.find(params:id)
  end
  
  def new
  end
end
