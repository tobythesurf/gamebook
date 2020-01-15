class Book < ApplicationRecord
  belongs_to :user
  has_many :scenarios
  acts_as_taggable_on :labels
end
