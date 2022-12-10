# frozen_string_literal: true

require 'rails_helper'
RSpec.describe WishesController, type: :controller do
  before do
    @user = create(:random_user)
    sign_in(@user)
    routes.draw { get 'toggle_wish' => 'wishes#toggle_wish' }
  end

  describe 'wished status should be toggled' do
    let(:listing) { create(:listing, user_id: @user.id) }
    let(:listing2) { create(:listing, user_id: @user.id) }
    let!(:false_wish) { create(:wish, wished: false, listing_id: listing.id, user_id: @user.id) }
    let!(:true_wish) { create(:wish, wished: true, listing_id: listing2.id, user_id: @user.id) }
    it 'should toggle to true' do
      post :toggle_wish, params: { params: { listing_id: listing.id } }
      response_body = JSON.parse(response.body)
      expect(response_body.keys).to match(%w[user_id wished id listing_id created_at updated_at])
      expect(response_body['user_id']).to eq(@user.id)
      expect(response_body['wished']).to eq(true)
      expect(response_body['listing_id']).to eq(listing.id)
    end

    it 'should toggle to false' do
      post :toggle_wish, params: { params: { listing_id: listing2.id } }
      response_body = JSON.parse(response.body)
      expect(response_body.keys).to match(%w[user_id wished id listing_id created_at updated_at])
      expect(response_body['user_id']).to eq(@user.id)
      expect(response_body['wished']).to eq(false)
      expect(response_body['listing_id']).to eq(listing2.id)
    end
  end
end
