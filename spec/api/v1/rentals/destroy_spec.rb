require 'rails_helper'

RSpec.describe "rentals#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rentals/#{rental.id}"
  end

  describe 'basic destroy' do
    let!(:rental) { create(:rental) }

    it 'updates the resource' do
      expect(RentalResource).to receive(:find).and_call_original
      expect { make_request }.to change { Rental.count }.by(-1)
      expect { rental.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
