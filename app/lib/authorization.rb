class Authorization
	class << self
		attr_accessor :current_user

	  def authorize(request)
	    header = request.headers['Authorization']
	    return false unless header
	    header = header.split(' ').last
	    decoded = JsonWebToken.decode(header)
	    @current_user = User.find(decoded[:user_id])
	  end
	end
end