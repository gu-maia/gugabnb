class ListingsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @listings = Listing.where(status: :draft)
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
