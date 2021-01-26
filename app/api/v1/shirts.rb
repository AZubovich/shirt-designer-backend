module V1
  class Shirts < Grape::API

    resource :shirts do
      desc 'get all shirts'
      get do
        shirt = Shirt.all
   		  present shirt, with: Entities::Shirt
      end

      desc 'Create new shirt'
        params do
          requires :title, type: String, desc: 'Title of the shirt'
          requires :description, type: String, desc: 'Shirt desciption'
          requires :price, type: Float, desc: 'Shirt price'
       	  requires :model, type: String, desc: 'Structure of the shirt'
       	  requires :image, type: String, desc: 'Image of the shirt'
        end
        post do
          error!({ errors: 'Not authorize' }, 401) unless Authorization.current_user(request)
          shirt = Shirt.new(declared(params))
          shirt.image = { data: params[:image] }
          if shirt.save
            { data: shirt }
          else
            error!({ errors: shirt.errors }, 422)
          end
        end
    end
  end
end