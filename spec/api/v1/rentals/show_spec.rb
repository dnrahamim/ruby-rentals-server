require 'rails_helper'

RSpec.describe "rentals#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rentals/#{rental.id}", params: params
  end

  describe 'basic fetch' do
    let!(:rental) { create(:rental) }

    it 'works' do
      expect(RentalResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('rentals')
      expect(d.id).to eq(rental.id)
    end
  end
end
