# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    let(:user) { create(:random_user) }
    let(:listing) { create(:listing, user_id: user.id, guests: 5) }

    context 'guest count must respect listing limit defined by the host' do
      it 'is over the limit' do
        expect { create(:booking, listing_id: listing.id, guests: 6) }.to raise_error(ActiveRecord::RecordInvalid)
      end
      it 'is within limits' do
        expect(create(:booking, listing_id: listing.id, guests: 4, guest_id: user.id)).to be_valid
      end
    end

    context 'bookings cannot overlap' do
      it 'overlaps' do
        booking_week_1 = listing.bookings.create!(attributes_for(:booking, guest_id: user.id, guests: 1,
                                                                           start_date: '01/01/2022'.to_date, end_date: '07/01/2022'.to_date))
        booking_week_2 = listing.bookings.build(attributes_for(:booking, guest_id: user.id, guests: 1,
                                                                         start_date: '01/01/2022'.to_date, end_date: '07/01/2022'.to_date))

        expect(booking_week_2.no_booking_overlap).to be_truthy
      end
      it 'does not overlap' do
        booking_week_1 = listing.bookings.create!(attributes_for(:booking, guest_id: user.id, guests: 1,
                                                                           start_date: '01/01/2022'.to_date, end_date: '07/01/2022'.to_date))
        booking_week_2 = listing.bookings.build(attributes_for(:booking, guest_id: user.id, guests: 1,
                                                                         start_date: '08/01/2022'.to_date, end_date: '14/01/2022'.to_date))

        expect(booking_week_2.no_booking_overlap).to be_nil
      end
    end

    it 'should default to pending_payment' do
      booking = listing.bookings.create(attributes_for(:booking, guest_id: user.id, guests: 1))

      expect(booking.status).to eq('pending_payment')
    end
  end
end
