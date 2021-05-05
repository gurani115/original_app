class RoomsController < ApplicationController
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
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    if @room.save
      redirect_to room_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:group_name, :species, :first_work, :second_work, :third_work, :fourth_work, :fifth_work, :first_text, :second_text, :third_text, :fourth_text, :fifth_text, :image).merge(user_id: current_user.id)
  end
end
