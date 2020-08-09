class Admins::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @category = Category.new
    @categories = Category.all
    # @article = Article.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @user = User.all
    @articles = Article.where(category_id: params[:id].to_i)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path, notice: "カテゴリーの追加に成功しました。"
    else
      @categories = Category.all
      render 'index', notice: "カテゴリーの追加に成功しました。"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admins_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admins_categories_path, alert: "カテゴリーの削除に成功しました。"
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :category_image, :body)
    end
end


