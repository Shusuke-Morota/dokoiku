class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  def index
  	#@articles = Article.all.page(params[:page]).per(10)
    query = { title_cont: params[:q] }
    @q = Article.ransack(query)
    @articles = @q.result.page(params[:page]).per(7)
  end

  def show
  	@article = Article.find(params[:id])
    @articles = Article.all
    @comment = Comment.new
    @comments = Comment.where(article_id: params[:id]).order(created_at: :desc).page(params[:page])
  end

  def new
  	@article = Article.new
    @article.article_images.build
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
  	params.require(:article).permit(:title, :body, :image, :category_id, :created_at, article_images_images: [])
  end
end
