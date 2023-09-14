require "rails_helper"

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { { email: user.email, password: user.password, name: 'quang' } }
  let(:invalid_attributes) { { email: 'quang@example.com', password: '' } }

  describe '#create' do
    context 'when valid_attributes' do
      it 'creates the user' do
        expect do
          post api_users_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error' do
        post api_users_path, params: { user: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#log_in' do
    context 'when valid params' do
      it 'log in the user' do
        post log_in_api_users_path, params: valid_attributes

        expect(response).to have_http_status(:accepted)
        expect(JSON.parse(body)).to have_key('access_token')
      end
    end

    context 'when invalid params' do
      it 'returns an error' do
        post log_in_api_users_path, params: invalid_attributes

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
