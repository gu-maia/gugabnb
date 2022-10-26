require 'rails_helper'

RSpec.describe Bed, type: :model do
  it { should belong_to(:room) }
  it { should define_enum_for(:bed_size).with([:twin_bed, :twin_bed_xl, :double_bed, :queen_bed, :king_bed, :california_bed, :crib]) }
end
