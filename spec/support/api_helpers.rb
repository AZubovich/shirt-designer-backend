module ApiHelpers
  def get_token(response)
    JSON.parse(response.body)['data']['token'] if JSON.parse(response.body)['data']
  end

  def get_error(response)
  	JSON.parse(response.body)['errors']
  end

  def authorize(user)
    token = JsonWebToken.encode(user_id: user.id)
    { headers: { 'Authorization' => "Bearer #{token}" } } 
  end

  def image
    'data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUA
     AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
     9TXL0Y4OHwAAAABJRU5ErkJggg=='
  end
end