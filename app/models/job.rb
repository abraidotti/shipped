class Job < ApplicationRecord
  has_many :boats
  has_many :users, through: :boats
end
