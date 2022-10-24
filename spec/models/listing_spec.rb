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

    expect(listing.status).to eq("draft")
  end
end
