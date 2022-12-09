# frozen_string_literal: true

require 'rails_helper'
RSpec.describe BookingsController, type: :controller do
  before do
    @user = create(:random_user)
    sign_in(@user)
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    let(:listing) { create(:listing, host: @user) }
    let(:params) do
      { booking: {
        start_date: '01/01/22',
        end_date: '02/01/22',
        listing_id: listing.id,
        guests: 1
      } }
    end
    it 'should validate parameters' do
      should permit(:listing_id, :start_date, :end_date, :guests).for(:create, params: params)
    end

    it 'should redirect to stripe checkout' do
      expect_any_instance_of(Booking).to receive(:checkout_session_url).and_return('http://google.com')

      post :create, params: params
      expect(response).to have_http_status(:see_other)
    end
  end

  describe 'GET new' do
    let(:listing) { double(id: 1) }
    before(:each) do
      allow(Listing).to receive(:find).and_return(Listing)
      get :new, params: { listing_id: listing.id }
    end

    it 'should instantiate variablels and return 200' do
      expect(assigns(:booking)).to be_a_new(Booking)
      expect(assigns(:listing)).to be(Listing)
      response.should render_template(:new)
    end
  end

  describe 'GET show' do
    let(:booking) { double(id: 1) }
    before do
      allow(Booking).to receive(:find).and_return(Booking)
      routes.draw { get 'show' => 'bookings#show' }
    end
    it 'should be 200' do
      get :show, params: { id: 1 }
      response.should render_template(:show)
    end
  end
end
