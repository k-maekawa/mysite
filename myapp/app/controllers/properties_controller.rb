class PropertiesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  def show
    @property = Property.find(params[:id])
    @rooms = @property.rooms.paginate(page: params[:page])
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

  def index
    @serach = Property.ransack(params[:search])
    @properties = @search.result(distinct: true).paginate(page: params[:page], per_page: 5)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:success] = "物件情報を更新しました！"
      redirect_to @property
    else
      render 'edit'
    end
  end

  def destroy
    Property.find(params[:id]).destroy
    flash[:success] = "物件が削除されました"
    redirect_to users_url
  end

  private
    def property_params
      params.require(:property).permit(:house_name, :area_name, :house_adress, :house_station,
                                       :house_skill, :house_distance, :rent, :property_img)
    end
  end
