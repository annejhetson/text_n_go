class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    if !params[:user_phone].nil?
      params[:user_phone].each do |to|
        params[:message][:to] = to
        @user = User.find(params[:user_id])
        @message = @user.messages.new(message_params)
        if @message.save
          flash[:notice] = "Your message was sent!"
        else
          render '/users/index.html.erb'
        end
      end
      redirect_to :back
    else
      @user = User.find(params[:user_id])
      @all_users_not_self = User.all - [@user]
      params[:message][:to] = params[:user_phone]
      @message = @user.messages.new(message_params)
      flash[:alert] = "try again!"
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
