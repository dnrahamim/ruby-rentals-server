require 'rails_helper'

RSpec.describe RentalResource, type: :resource do
  describe 'serialization' do
    let!(:rental) { create(:rental) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rental.id)
      expect(data.jsonapi_type).to eq('rentals')
    end
  end

  describe 'filtering' do
    let!(:rental1) { create(:rental) }
    let!(:rental2) { create(:rental) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: rental2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([rental2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:rental1) { create(:rental) }
      let!(:rental2) { create(:rental) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            rental1.id,
            rental2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            rental2.id,
            rental1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
