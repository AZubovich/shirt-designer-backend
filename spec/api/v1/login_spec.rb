require 'rails_helper'

describe 'V1::Login' do
  let(:user) { create(:user) }

  context 'when POST /api/v1/login successful' do
    before do
      post '/api/v1/login', params: { username: user.username, password: user.password }
    end

    let(:token) { get_token(response) }

    it 'is token present' do
      expect(token).to be_present
    end

    it 'is token valid' do
      expect(JsonWebToken.decode(token)[:user_id]).to eq(user.id)
    end
  end

  context 'when POST /api/v1/login unsuccessful' do
    before do
      post '/api/v1/login', params: { username: '111_111', password: '12345678' }
    end

    it 'return error: invalid username or password' do
      expect(get_error(response)).to eq('Invalid username or password')
    end
  end
end