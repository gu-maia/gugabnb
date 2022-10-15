class ListingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @listings = Listing.where(status: :draft)
  end

  def show
  end
end

