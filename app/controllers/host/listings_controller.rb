class Host::ListingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to host_listing_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @listings = current_user.listings
  end

  def update
  end

  def new
    @listing = Listing.new
  end

  def destroy
  end

  def listing_params
    params.require(:listing).permit(:user_id, :short_description, :long_description, :status, :guests, :address_line1, :address_line2, :city, :state, :postal_code, :country)
  end
end
