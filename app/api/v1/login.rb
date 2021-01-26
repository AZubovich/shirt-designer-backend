module V1
  class Login < Grape::API
    resource :login do
      desc 'Login user'
      params do
        requires :username, type: String, desc: 'User nickname'
        requires :password, type: String, desc: 'User password'
      end
      post do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          { data: Entities::Login.represent(user) }
        else
          error!({ errors: "Invalid username or password" }, 401)
        end
      end
    end
  end
end