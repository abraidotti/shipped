class Job < ApplicationRecord
  validates_length_of :description, minimum: 20
  validates :cost, numericality: {greater_than: 999.99}
  validates :name, :containers_needed, presence: true
  validates :containers_needed, numericality: {greater_than: 1}
  has_and_belongs_to_many :boats
  has_many :users, through: :boats
  validates :origin, uniqueness: { scope: :destination, message: "Origin and destination should be different." }
end
