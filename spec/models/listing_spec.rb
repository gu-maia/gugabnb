# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe 'associations' do
    it { should belong_to(:host).class_name('User') }
    it { should have_many(:rooms).dependent(:destroy) }
    it { should have_many(:pricings).dependent(:destroy) }
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:bookings).dependent(:destroy) }
    it { should have_many_attached(:images) }
  end
  describe 'validations' do
    it { should validate_presence_of(:short_description) }
    it { should validate_numericality_of(:guests).only_integer }
  end
  it 'should default to draft' do
    user = build(:random_user)
    listing = user.listings.build(attributes_for(:random_listing))

    expect(listing.status).to eq('draft')
  end
  
  describe 'methods' do
    let(:user) { create(:random_user) }
    let(:listing) { create(:listing, user_id: user.id) }
    it 'should average review stars' do
      expect(listing.star_average).to eq(0) 
    end

    context 'average review stars' do
      it 'has one review' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 5)
        expect(listing.reload.star_average).to eq("5.0") 
      end 
      
      it 'has two reviews (5+4)' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 5)
        review2 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 4)
        expect(listing.reload.star_average).to eq("4.5") 
      end 

      it 'has three reviews (5+4+2)' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 5)
        review2 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 4)
        review3 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 2)
        expect(listing.reload.star_average).to eq("3.67") 
      end 
    end

    context 'review counting' do
      let(:user) { create(:random_user) }
      let(:listing) { create(:listing, user_id: user.id) }
      it 'should be 1' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        expect(listing.reload.review_count).to eq(1)
      end

      it 'should be 2' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        review2 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        expect(listing.reload.review_count).to eq(2)
      end

      it 'should be 3' do
        review = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        review2 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        review3 = create(:review, listing_id: listing.id, guest_id: user.id, stars: 1)
        expect(listing.reload.review_count).to eq(3)
      end
    end
  end
end
