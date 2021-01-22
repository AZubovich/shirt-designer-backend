module Entities
  class Shirt < Grape::Entity
    expose :id, :title, :description, :price, :model
  end
end