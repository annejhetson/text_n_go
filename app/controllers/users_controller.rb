class UsersController < ApplicationController
  def index
    @message = Message.new
    @user = current_user
    @recieved_messages = Message.where(to: @user.phone)
    @all_users_not_self = User.all - [@user]
  end
end
