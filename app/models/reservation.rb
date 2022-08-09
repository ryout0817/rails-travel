class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :room_image
end
