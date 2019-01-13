require 'rails_helper'

RSpec.describe RentalResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'rentals',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RentalResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Rental.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:rental) { create(:rental) }

    let(:payload) do
      {
        data: {
          id: rental.id.to_s,
          type: 'rentals',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RentalResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { rental.reload.updated_at }
      # .and change { rental.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:rental) { create(:rental) }

    let(:instance) do
      RentalResource.find(id: rental.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Rental.count }.by(-1)
    end
  end
end
