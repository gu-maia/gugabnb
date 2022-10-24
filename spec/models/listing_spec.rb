require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe 'associations' do
    it { should belong_to(:host).class_name('User') }
    it { should have_many(:rooms).dependent(:destroy) }
  end  
  it 'should default to draft' do
    user = build(:random_user)
    listing = user.listings.build(attributes_for(:random_listing))

    expect(listing.status).to eq("draft")
  end
end
