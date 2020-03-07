class Scenario < ApplicationRecord
  belongs_to :book

  validates :scenario_no, inclusion: { in: 1..999 }
  validates :next_no1, inclusion: { in: 0..999 }
  validates :next_no2, inclusion: { in: 0..999 }
  validates :next_no3, inclusion: { in: 0..999 }
end
