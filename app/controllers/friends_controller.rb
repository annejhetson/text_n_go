class FriendsController <ApplicationController
  def index
    @user = User.find(params[:user_id])
    @friend = Friend.new
  end

  def new
    @user = User.find(params[:user_id])
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      @user = User.find(params[:user_id])
      render "index"
    end
  end

  def edit
    @friend = Friend.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      bgff
      @user = User.find(params[:user_id])
      render "index"
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    @user = User.find(params[:user_id])
    render 'index'
  end

private
  def friend_params
    params.require(:friend).permit(:name, :phone, :user_id)
  end
end
