class Article < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :category
	# attachment :image

	has_many :article_images, dependent: :destroy
	accepts_attachments_for :article_images, attachment: :image

    with_options presence: true do
    	validates :title
    	validates :body
    	# validates :image
    end
end
