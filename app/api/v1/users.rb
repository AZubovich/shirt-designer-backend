module V1
  class Users < Grape::API
    resource :users do
      desc 'Create new user'
        params do
          requires :username, type: String, desc: 'User nickname'
          requires :password, type: String, desc: 'User password'
        end
        post do
          user = User.new(declared(params))
          if user.save
            { data: Entities::Login.represent(user) }
          else
            error!({ errors: user.errors }, 422)
          end
        end
    end
  end
end