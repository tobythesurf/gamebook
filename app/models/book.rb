class Book < ApplicationRecord
  belongs_to :user
  has_many :scenarios, dependent: :destroy
  acts_as_taggable_on :labels
end
