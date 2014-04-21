class UsersController < ApplicationController
  def index
    @message = Message.new
    @user = current_user
    @recieved_messages = Message.where(to: @user.phone)
  end
end
