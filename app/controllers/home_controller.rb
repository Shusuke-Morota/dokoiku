class HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@users = User.all
  	@all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  	@q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page]).per(10).order(id: "DESC").all.page(params[:page]).per(5)
  end
end
