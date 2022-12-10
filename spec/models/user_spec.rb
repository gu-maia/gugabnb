# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:listings) }
  it { should have_many(:reviews).through(:listings) }
  it { should have_many(:bookings).class_name('Booking').with_foreign_key('guest_id') }
  it { should have_many(:wishes) }
  it { should have_many(:notifications) }

  describe 'methods' do
    let(:user) { build(:user, first_name: 'First', last_name: 'Last') }
    it 'should return full name' do
      user.full_name.should eq('First Last')
    end

    context 'verify if user has wished a listing' do
      let(:user) { create(:random_user) }
      let(:listing) { create(:listing, user_id: user.id) }
      it 'is not wished' do
        expect(user.wished?(listing)).to be_falsey
      end

      let(:wished_listing) { create(:listing, user_id: user.id) }
      let!(:wish) { create(:wish, wished: true, user_id: user.id, listing_id: wished_listing.id) }
      it 'is wished' do
        expect(user.wished?(wished_listing)).to be_truthy
      end
    end

    pending 'Reviews as host count # Pending because the database modeling needs to be reviewed'
  end
end
