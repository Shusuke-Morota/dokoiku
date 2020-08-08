class RelationshipsController < ApplicationController
	def follow # フォローする
		current_user.follow(params[:id])
		redirect_to users_path
	end

	def unfollow # フォローを外す
	    current_user.unfollow(params[:id])
	    redirect_to users_path
	end
end
