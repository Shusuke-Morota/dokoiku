class FavoritesController < ApplicationController

	def create #current_userに結びついているいいねを作成している。いいねしたら、前の画面に遷移する。 ex)詳細画面でいいねしたら詳細画面へ
		@favorites = current_user.favorites.create(article_id: params[:article_id])
	end

	def destroy
		@article = Article.find(params[:article_id])
		@favorite = current_user.favorites.find_by(article_id: @article.id)
		@favorite.destroy
	end
end
