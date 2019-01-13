require 'rails_helper'

RSpec.describe "rentals#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rentals", params: params
  end

  describe 'basic fetch' do
    let!(:rental1) { create(:rental) }
    let!(:rental2) { create(:rental) }

    it 'works' do
      expect(RentalResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['rentals'])
      expect(d.map(&:id)).to match_array([rental1.id, rental2.id])
    end
  end
end
