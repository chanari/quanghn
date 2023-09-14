require "rails_helper"

RSpec.describe 'V1::ShortLinks', type: :request do
  let(:user) { create(:user) }
  let(:short_link) { create(:short_link, user: user) }
  let(:valid_params) { { original_url: Faker::Internet.url } }
  let(:invalid_params) { { original_url: short_link.original_url } }

  describe '#create' do
    context 'when the request is valid' do
      it 'create a shorten' do
        post api_v1_short_links_path, headers: authenticate_headers(user), params: valid_params, as: :json

        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error' do
        post api_v1_short_links_path, params: valid_params, as: :json

        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error' do
        post api_v1_short_links_path, headers: authenticate_headers(user), params: invalid_params, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
