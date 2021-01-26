class Shirt < ApplicationRecord
  validates :title , presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :model, presence: true

  has_one_base64_attached :image
  belongs_to :user
end
