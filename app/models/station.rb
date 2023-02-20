class Station < ApplicationRecord
  belongs_to :property
  validates :line, presence: true
  validates :name, presence: true
  validates :walking_minutes, presence: true
end
