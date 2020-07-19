class HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@articles = Article.all.order(id: "DESC")
  	@users = User.all
  end
end
