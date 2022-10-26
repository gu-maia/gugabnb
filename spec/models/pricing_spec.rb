# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pricing, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:cleaning_fee) }
    it { should validate_presence_of(:listing) }
    it { should validate_presence_of(:status) }
    it { should define_enum_for(:status).with(%i[active inactive]) }
  end

  it 'should convert to cents' do
    pricing_25 = build(:pricing, value: 25)

    expect(pricing_25.value_in_cents).to eq(2500)

    pricing_50_50 = build(:pricing, value: 50.50)

    expect(pricing_50_50.value_in_cents).to eq(5050)
  end
end
