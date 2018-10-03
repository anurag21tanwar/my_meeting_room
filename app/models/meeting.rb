class Meeting < ApplicationRecord
  belongs_to :conference_room
  has_and_belongs_to_many :employees

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :conference_room, presence: true
  validates :booked_by, presence: true
  validate :not_overlap

  scope :overlaps,
        ->(start_time, end_time, conference_room_id) do
          where('((start_time <= ?) AND (end_time >= ? AND conference_room_id = ?))',
                start_time, end_time, conference_room_id)
        end

  def not_overlap
    errors.add(:message, 'Meeting Schedule Coincides') if
      overlaps?(start_time, end_time)
  end

  def scheduler
    Employee.find(booked_by)
  end

  def overlaps?(start_time, end_time)
    Meeting.overlaps(start_time, end_time, conference_room_id).exists?
  end
end
