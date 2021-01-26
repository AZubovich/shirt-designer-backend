module V1
  class Base < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json

    mount V1::HealthCheck
    mount V1::Shirts
    mount V1::Users
    mount V1::Login
  end
end