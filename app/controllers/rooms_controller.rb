class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :login_user, only: [:edit, :update, :destroy]
  def index
    @rooms = Room.order(id: :DESC)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @room.update(room_params)
    if @room.save
      redirect_to room_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:group_name, :species, :first_work, :second_work, :third_work, :fourth_work, :fifth_work, :first_text, :second_text, :third_text, :fourth_text, :fifth_text, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def login_user
    redirect_to root_path unless current_user.id == @room.user_id
  end
end
