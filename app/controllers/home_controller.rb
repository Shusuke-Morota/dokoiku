class HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@users = User.all
  	@all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  	@q = Article.ransack(params[:q])
  	@articles = @q.result(distinct: true).order(id: "DESC")
  end
end
