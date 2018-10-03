class ConferenceRoom < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, uniqueness: true

  scope :booked, lambda do |start_time, end_time|
    joins(:meetings).where('start_time <= ? AND end_time >= ?',
                           start_time, end_time)
  end
  scope :available_rooms, lambda do |start_time, end_time|
    joins(:meetings).where('(start_time >= ? AND end_time >= ?) OR
                            (start_time <= ? AND end_time <= ?)',
                           start_time, end_time)
  end

  def self.available(start_time, end_time)
    booked_rooms = booked(start_time, end_time).pluck(:id)
    if booked_rooms.blank?
      ConferenceRoom.all
    else
      ConferenceRoom.where('id not in (?)', booked_rooms)
    end
  end
end
