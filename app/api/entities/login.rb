module Entities
  class Login < Grape::Entity
    expose :username, :token, :exp

    private

    alias user object

    def token
      JsonWebToken.encode(user_id: user.id)
    end

    def exp
      JsonWebToken::EXP_TIME.strftime('%m-%d-%Y %H:%M')
    end
  end
end