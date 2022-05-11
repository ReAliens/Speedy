require 'rails_helper'

describe 'Items API', type: :request do
  describe 'GET /items' do
    it 'returns all items' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed@gmail.com', password: '123456789')
      FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description', specs: 'specs', price: 20,
                               user_id: user.id)

      get '/api/v1/items'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /items/:id' do
    it 'returns one item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')
      item = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                      specs: 'specs', price: 20, user_id: user.id)

      get "/api/v1/items/#{item.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /items' do
    it 'create new item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')

      expect do
        post '/api/v1/items', params: { item: { name: 'car', photo: 'new photo', description: 'description',
                                                specs: 'specs', price: 20, user_id: user.id } }
      end.to change { Item.count }.from(0).to(1)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /items/:id' do
    it 'delete one item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')
      item1 = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                       specs: 'specs', price: 20, user_id: user.id)

      expect do
        delete "/api/v1/items/#{item1.id}"
      end.to change { Item.count }.from(1).to(0)

      expect(response).to have_http_status(:success)
    end
  end
end
