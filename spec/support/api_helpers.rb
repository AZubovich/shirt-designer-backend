module ApiHelpers
  def get_token(response)
    JSON.parse(response.body)['data']['token'] if JSON.parse(response.body)['data']
  end

  def get_error(response)
  	JSON.parse(response.body)['errors']
  end
end