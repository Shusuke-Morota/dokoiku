class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  def index
  	@articles = Article.all.page(params[:page]).per(10)
  end

  def show
  	@article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	@article.user_id = current_user.id
  	if @article.save
  		redirect_to article_path(@article), notice: "投稿に成功しました。"
  	else
  		render :new
  	end
  end

  def edit
  	@article = Article.find(params[:id])
  	if @article.user_id != current_user.id
  		redirect_to articles_path, alert: "不正なアクセスを検出しました。"
  	end
  end

  def update
  	@article = Article.find(params[:id])
  	if @article.update(article_params)
  		redirect_to article_path(@article), notice: "更新に成功しました。"
  	else
  		render :edit
  	end
  end

  def destroy
  	article = Article.find(params[:id])
  	article.destroy
  	redirect_to articles_path
  end

  private
  def article_params
  	params.require(:article).permit(:title, :body, :image, :category_id, :created_at)
  end
end
