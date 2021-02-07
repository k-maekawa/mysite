class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @room = Room.new
    @property = Property.find(params[:property_id])
  end

  def create
    @property = Property.find(params[:property_id])
    @room = @property.rooms.build(room_params)
    if @room.save!
      flash[:success] = "お部屋の情報登録しました！"
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def index
    @rooms = @property.room.paginate(page: params[:page])
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
    @room = @property.rooms.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to property_path(@room.property)
  end

  def destroy
    @room = Room.find_by(params[:id]).destroy
    flash[:success] = "部屋情報が削除されました"
    redirect_to root_url
  end

  private

  def room_params
    params.require(:room).permit(:vacant_room, :room_number, :space, :room_type, :room_img)
  end
end
