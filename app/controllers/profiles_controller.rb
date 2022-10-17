class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private

  def profile_params
    params.require(:id)
  end
end
