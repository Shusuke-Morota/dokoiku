class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  attachment :profile_image
  validates :name, presence: true
  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  has_many :article_images, dependent: :destroy
  accepts_attachments_for :article_images, attachment: :image

  def already_favorited?(article)
    self.favorites.exists?(article_id: article.id)
         	#selfにはcurrent_userが入る。current_userに結びついているいいねの中でarticle_idが今いいねしようとしているarticle.idが存在しているか
  end

  def follow(user_id) # ユーザーをフォローする
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id) # フォローを外す
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user) # フォローしているかを確認する
    following_user.include?(user)
  end
end
