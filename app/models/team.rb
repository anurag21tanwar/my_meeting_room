class Team < ApplicationRecord
  has_and_belongs_to_many :employees

  validates :name, uniqueness: true, presence: true

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
