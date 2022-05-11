require 'rails_helper'

describe 'reserveds API', type: :request do
  describe 'GET /reserveds' do
    it 'returns all reserveds' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed@gmail.com', password: '123456789')
      item = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                      specs: 'specs', price: 20, user_id: user.id)
      FactoryBot.create(:reserved, name: 'car', city: 'new city', started_at: '2022-05-20',
                                   ended_at: '2022-5-30', user_id: user.id, item_id: item.id)

      get '/api/v1/reserveds'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /items/:id/reserveds/:id' do
    it 'returns one reserved item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')
      item = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                      specs: 'specs', price: 20, user_id: user.id)
      reserved_item = FactoryBot.create(:reserved, name: 'car', city: 'new city', started_at: '2022-05-20',
                                                   ended_at: '2022-5-30', user_id: user.id, item_id: item.id)

      get "/api/v1/items/#{item.id}/reserveds/#{reserved_item.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /items/:id/reserveds' do
    it 'create new reserved item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')
      item = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                      specs: 'specs', price: 20, user_id: user.id)

      expect do
        post "/api/v1/items/#{item.id}/reserveds",
             params: { reserved: { name: 'car', city: 'new city', started_at: '2022-05-20',
                                   ended_at: '2022-5-30', user_id: user.id, item_id: item.id } }
      end.to change { Reserved.count }.from(0).to(1)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /items/:id/reserveds/:id' do
    it 'delete one reserved item' do
      user = FactoryBot.create(:user, name: 'Ahmed', email: 'ahmed1@gmail.com', password: '123456789')
      item = FactoryBot.create(:item, name: 'car', photo: 'new photo', description: 'description',
                                       specs: 'specs', price: 20, user_id: user.id)
      reserved_item = FactoryBot.create(:reserved, name: 'car', city: 'new city', started_at: '2022-05-20',
                                                   ended_at: '2022-5-30', user_id: user.id, item_id: item.id)

      expect do
        delete "/api/v1/items/#{item.id}/reserveds/#{reserved_item.id}"
      end.to change { Reserved.count }.from(1).to(0)

      expect(response).to have_http_status(:success)
    end
  end
end
