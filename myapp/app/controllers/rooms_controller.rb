class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @room = Room.new
  end

  def create
    @room = @property.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render "/new"
    end
  end

  def index
    @rooms = @property.room.paginate(page: params[:page])
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:vacant_room, :room_number, :space, :room_type, :room_img)
  end
end
