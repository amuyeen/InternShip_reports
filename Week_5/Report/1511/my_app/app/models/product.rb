class Product < ApplicationRecord
	validates :title, presence: true 
	validates :author, uniqueness: true 
end
