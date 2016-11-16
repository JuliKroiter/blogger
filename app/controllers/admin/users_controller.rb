class Admin::UsersController < Admin::AdminController
  def index
    @users = []
  end

  def new
    # @user = User.new
  end

  def create
    # @user = User.create(user_params)
    #
    # redirect_to :index
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # @user.update(user_params)
    #
    # redirect_to :index
  end

  def destroy
    # @user = User.find(params[:id])
    # @user.destroy
    #
    # redirect_to :index
  end

  private

  def user_params
    # params.require(:user).permit(:email, :password)
  end
end
