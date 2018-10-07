class Employee < ApplicationRecord
  self.primary_key = :emp_id

  has_and_belongs_to_many :teams
  has_and_belongs_to_many :meetings

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def self.get_participants(participants)
    return [] if participants.blank?
    @teams = Team.get_p(participants)
    @participants = @teams.map(&:employees)
    @participants << Employee.get_p(participants)
    @participants.flatten!.uniq
  rescue
    return []
  end

  def active_bookings
    Meeting.where(booked_by: id).where('end_time > ?', Time.now)
  end

  def self.get_p(participants)
    e = arel_table[:name]
    p_arel = participants.map { |p| e.matches("%#{p}%") }
    query = p_arel.shift
    p_arel.each do |x|
      query = query.or(x)
    end
    where(query)
  end
end
