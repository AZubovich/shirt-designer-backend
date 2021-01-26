module Entities
  class Shirt < Grape::Entity

    expose :id, :title, :description, :price, :image

    private

    alias user object

    def image
      Rails.application.routes.url_helpers.rails_blob_url(user.image) if user.image.attached?
    end
  end
end