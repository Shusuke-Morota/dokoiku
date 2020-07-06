class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         attachment :profile_image
         has_many :articles, dependent: :destroy
         has_many :favorites, dependent: :destroy

         def already_favorited?(article)
         	self.favorites.exists?(article_id: article.id)
         	#selfにはcurrent_userが入る。current_userに結びついているいいねの中でarticle_idが今いいねしようとしているarticle.idが存在しているか
         end
end
