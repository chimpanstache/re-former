class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      redirect_to new_users_path, notice: "Successfully created account"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
