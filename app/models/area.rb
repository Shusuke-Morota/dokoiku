class Area < ApplicationRecord
	belongs_to :admin
	attachment :image

	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: true
end
