class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to :back
    else
      render '/users/index.html.erb'
    end
  end

  def show
    @message = Message.find(params[:id])
  end


private
  def message_params
    params.require(:message).permit(:to, :from, :body, :user_id)
  end
end
