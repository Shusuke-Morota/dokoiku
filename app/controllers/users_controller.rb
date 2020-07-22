class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
  	else
  		render :edit, alert: "ユーザー情報の更新に失敗しました。"
  	end
  end

  def destroy
  end

  # 自分がフォローしているユーザー一覧
  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end


  private
  def user_params
  	params.require(:user).permit(:name, :email, :profile, :profile_image)
  end

  def user_id
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
