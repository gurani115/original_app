class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def new
    @message = Message.new
    @rooms = Room.new
  end

  def create
    @rooms = Message.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end

    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def room_params
    params.require(:message).permit(:room_name)
  end
end
