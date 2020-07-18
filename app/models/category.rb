class Category < ApplicationRecord
	has_many :articles, dependent: :destroy
	attachment :category_image
end
