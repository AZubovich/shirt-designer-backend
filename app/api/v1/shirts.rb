module V1
  class Shirts < Grape::API
    resource :shirts do
      desc 'get all shirts'
      get do
        shirt = Shirt.all
   		present shirt, with: Entities::Shirt
      end
    end
  end
end