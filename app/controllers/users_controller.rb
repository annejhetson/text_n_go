class UsersController < ApplicationController
  def index
    @message = Message.new
    if !current_user.nil?
      @user = current_user
    end
  end
end
