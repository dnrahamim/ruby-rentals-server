class RentalsController < ApplicationController
  def index
    rentals = RentalResource.all(params)
    respond_with(rentals)
  end

  def show
    rental = RentalResource.find(params)
    respond_with(rental)
  end

  def create
    rental = RentalResource.build(params)

    if rental.save
      render jsonapi: rental, status: 201
    else
      render jsonapi_errors: rental
    end
  end

  def update
    rental = RentalResource.find(params)

    if rental.update_attributes
      render jsonapi: rental
    else
      render jsonapi_errors: rental
    end
  end

  def destroy
    rental = RentalResource.find(params)

    if rental.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: rental
    end
  end
end
