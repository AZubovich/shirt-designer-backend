
describe 'V1::Shirts' do
  let(:user) { create(:user, username: 'shirt_test') }
  let!(:shirt) { create(:shirt) }
  let(:shirt_params) { { title: 'created shirt', description: 'desc', price: 1.33, model: 'model', image: image } }

  context 'GET api/v1/shirts' do
    before do
      get'/api/v1/shirts'
    end

    it 'get 200 status' do
      expect(response.status).to eq(200)
    end

    it 'get shirts list' do
      expect(JSON(response.body).size).to be > 0
    end
  end

  context 'POST api/v1/shirts' do
    before do
      post'/api/v1/shirts', { params: shirt_params }.merge(authorize(user))
    end

    it 'get 201 status' do
      expect(response.status).to eq(201)
    end

    it 'return created shirt' do
      expect(JSON(response.body).size).to eq(1)
    end
  end

  context 'POST api/v1/shirts unauthorized' do
    before do
      post'/api/v1/shirts', { params: shirt_params }
    end

    it 'get 401 status' do
      expect(response.status).to eq(401)
    end
  end

  context 'SHOW api/v1/shirts' do
    before do
      get"/api/v1/shirts/#{shirt.id}"
    end

    it 'get 200 status' do
      expect(response.status).to eq(200)
    end

    it 'return created shirt' do
      expect(JSON.parse(response.body)['title']).to eq('factoryShirt')
    end
  end
end