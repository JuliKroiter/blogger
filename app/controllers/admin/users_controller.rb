class Admin::UsersController < Admin::AdminController
  load_and_authorize_resource :user, param_method: :user_params

  def update
    @user.update(user_params)

    if @user.valid?
      redirect_to admin_users_path, flash: {success: "User updated"}
    else
      render :'admin/users/edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_path, flash: {success: "User destroyed"}
  end

  private

  def user_params
    params[:user].except!(:password, :password_confirmation) if params[:user][:password_confirmation].blank?
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :role)
  end
end
