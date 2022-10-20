class BookingsController < ApplicationController
before_action :authenticate_user!

  
def create
  @listing = Listing.find(params[:booking][:listing_id])

  @booking = current_user.bookings_as_guest.new(booking_params)

  if @booking.save
    redirect_to booking_path(@booking)
  else
    flash[:errors] = @booking.errors.full_messages
    render :new, status: :unprocessable_entity
  end
end

def new
  @booking = Booking.new
  @listing = Listing.find(params[:listing_id])
end

def show
end

private

def booking_params
  params.require(:booking).permit(:listing_id, :start_date, :end_date, :guests)
end
end
