class UsersController < ApplicationController
  def index
    @message = Message.new
    @user = current_user
  end
end
