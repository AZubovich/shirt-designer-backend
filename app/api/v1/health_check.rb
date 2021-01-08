module V1
  class HealthCheck < Grape::API
    resource :health_check do
      desc 'health check'
      get do
        'I AM ALIVE!!!'
      end
    end
  end
end