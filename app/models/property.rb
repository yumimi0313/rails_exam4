class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: proc {|attributes| attributes['line'].blank? and attributes['name'].blank? and attributes['walking_minutes'].blank?}, allow_destroy: true
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
end
