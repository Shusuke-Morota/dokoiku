class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :article
	validates :content, presence: true
	paginates_per 6
end
