module V1
  class Base < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json

    mount V1::HealthCheck
    mount V1::Shirts
  end
end