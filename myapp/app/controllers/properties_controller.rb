class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end
  
  def new
    @property =Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "物件登録完了しました！"
      redirect_to @property
    else
      render 'new'
    end
  end
end

private
  def property_params
    params.require(:property).permit(:house_name, :area_name, :house_adress, :house_station,
                                     :house_skill, :house_distance, :rent)
  end
