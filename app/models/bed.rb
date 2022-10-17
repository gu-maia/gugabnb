class Bed < ApplicationRecord
  belongs_to :room

  enum bed_size: {
    twin_bed: 0,
    twin_bed_xl: 1,
    double_bed: 2,
    queen_bed: 3,
    king_bed: 4,
    california_bed: 5,
    crib: 6
  }
end
