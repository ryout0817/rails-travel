class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :room_image

  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :people, numericality: true
  validate :date_before_start
  validate :date_before_finish
  
  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降のものを選択してください") if start_day < Date.today
  end
  def date_before_finish
    return if finish_day.blank? || start_day.blank?
    errors.add(:finish_day, "は開始日以降のものを選択してください") if finish_day < start_day
  end

end
