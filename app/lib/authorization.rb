class Authorization
  def self.current_user(request)
    header = request.headers['Authorization']
    return false unless header
    header = header.split(' ').last
    decoded = JsonWebToken.decode(header)
    User.find(decoded[:user_id])
  end
end