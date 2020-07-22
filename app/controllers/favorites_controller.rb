class FavoritesController < ApplicationController

	before_action :article_params

    def index
    	@favorites = Favorite.all
    end

	def create
		favorite = current_user.favorites.new(article_id: @article.id)
		favorite.save
	end

	def destroy
		@favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id).destroy
	end

	private
	def article_params
		@article = Article.find(params[:article_id])
	end
end
