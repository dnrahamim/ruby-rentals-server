require 'rails_helper'

RSpec.describe "rentals#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rentals/#{rental.id}", payload
  end

  describe 'basic update' do
    let!(:rental) { create(:rental) }

    let(:payload) do
      {
        data: {
          id: rental.id.to_s,
          type: 'rentals',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RentalResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { rental.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
