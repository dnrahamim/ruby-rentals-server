require 'rails_helper'

RSpec.describe "rentals#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/rentals", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'rentals',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(RentalResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { Rental.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
