class Shirt < ApplicationRecord
	validates :title , presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :model, presence: true
end
