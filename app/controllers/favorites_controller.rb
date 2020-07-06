class FavoritesController < ApplicationController

	def create #current_userに結びついているいいねを作成している。いいねしたら、前の画面に遷移する。 ex)詳細画面でいいねしたら詳細画面へ
		@favorites = current_user.favorites.create(article_id: params[:article_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@favorite = current_user.favorites.find_by(article_id: @article.id)
		@favorite.destroy
		redirect_back(fallback_location: root_path) #1つ前のURLが見つからなかったらroot_pathに遷移させる。
	end
end
