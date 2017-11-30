class Boat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :container_amount, presence: true, numericality: { greater_than: 49}
  belongs_to :user
  has_and_belongs_to_many :jobs
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
