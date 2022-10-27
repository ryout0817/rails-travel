class Room < ApplicationRecord
  belongs_to :user #optional: true = 外部キーのnilを許可する、コントローラーのsaveに必要だった
  has_many :reservations

  has_one_attached :room_image #active strageと関連付けさせる

  # バリデーション
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :price, numericality: true, presence: true
  validates :city, presence: true
  validates :room_image, presence: true
end
