module Entities
  class Shirt < Grape::Entity
    expose :title, :description, :price, :model
  end
end