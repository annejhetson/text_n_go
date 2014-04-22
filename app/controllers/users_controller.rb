class UsersController < ApplicationController
  def index
    @message = Message.new
    if !current_user.nil?
      @user = current_user
      @recieved_messages = Message.where(to: @user.phone)
      @all_users_not_self = User.all - [@user]
    end
  end
end
