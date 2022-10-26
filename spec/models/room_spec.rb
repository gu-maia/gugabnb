require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should belong_to(:listing) }
  it { should have_many(:beds) }
  it { should define_enum_for(:room_type).with([:single_room, :double_room, :triple_room, :quad_room, :queen_room, :king_room, :twin_room, :studio_room])}
end
