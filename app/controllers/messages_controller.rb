class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to new_message_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end


private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
