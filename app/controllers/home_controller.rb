class HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@articles = Article.all.order(id: "DESC")
  	@users = User.all
  	@all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  end
end
