class WishesController < ApplicationController
  before_action :authenticate_user!
  
  def toggle_wish
    wish = current_user.wishes.find_or_create_by(listing_id: params[:params][:listing_id])
    wish.toggle!(:wished)
    render json: wish
  end
end



