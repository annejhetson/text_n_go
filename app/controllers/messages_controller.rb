class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    if params[:user_phone].nil? || params[:message][:body] == ""
      @user= current_user
      @message = Message.new
      @messages = Message.all
      flash[:alert] = "There was an error processing your message"
      render 'users/index'
    else
      @array = []
      @user = User.find(params[:user_id])
      params[:user_phone].each do |to|
        params[:message][:to] = to
        @friend = Friend.find_by(phone: to)
        params[:message][:friend_id] = @friend.id
        params[:message][:user_id] = @user.id
        @message = Message.create(message_params)
      end
      flash[:notice] = ActionController::Base.helpers.pluralize(params[:user_phone].size, 'message') + " sent"
      redirect_to :back
    end
  end

  def show
    @message = Message.find(params[:id])
  end


private
  def message_params
    params.require(:message).permit(:to, :from, :body, :user_id, :friend_id)
  end
end
