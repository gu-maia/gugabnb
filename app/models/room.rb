class Room < ApplicationRecord
  belongs_to :listing
  has_many :beds, dependent: :destroy

  enum room_type: {
    single_room: 0,
    double_room: 1,
    triple_room: 2,
    quad_room: 3,
    queen_room: 4,
    king_room: 5,
    twin_room: 6,
    studio_room: 7
  }
end
