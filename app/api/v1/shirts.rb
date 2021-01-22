module V1
  class Shirts < Grape::API
    resource :shirts do
      desc 'get all shirts'
      get do
        shirt = Shirt.all
   		present shirt, with: Entities::Shirt
      end

      desc 'Create new office'
        params do
          requires :title, type: String, desc: 'Title of the shirt'
          requires :description, type: String, desc: 'Shirt desciption'
          requires :price, type: Float, desc: 'Shirt price'
       	  requires :model, type: String, desc: 'Structure of the shirt'
       	  #requires :image, type: String, desc: 'Image of the shirt'
        end
        post do
          shirt = Shirt.new(declared(params))
          if shirt.save
            { data: shirt }
          else
            { date: { error: shirt } }
          end
        end
    end
  end
end