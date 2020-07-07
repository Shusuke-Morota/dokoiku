class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update(user_params)
  		redirect_to user_path, notice: "ユーザー情報を更新しました。"
  	else
  		render :edit
  	end
  end

  def destroy
  end


  private
  def user_params
  	params.require(:user).permit(:name, :email)
  end
end
