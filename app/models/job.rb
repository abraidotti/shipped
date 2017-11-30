class Job < ApplicationRecord
  validates_length_of :description, minimum: 20, too_short: "please enter at least 20 characters"
  validates :cost, numericality: {greater_than: 999.99}
  validates :origin_diff_from_dest
  has_and_belongs_to_many :boats
  has_many :users, through: :boats

  def origin_diff_from_dest
    if self.origin == self.destination
      errors.add("The destination cannot be the same as the origin.")
    end
  end
end
