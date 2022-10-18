class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  private

  def profile_params
    params.require(:id)
  end
end
