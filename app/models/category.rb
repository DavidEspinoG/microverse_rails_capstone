class Category < ApplicationRecord
  belongs_to :user
  has_many :labels
  has_many :operations, through: :labels
  validates :name, presence: true
  validates :icon, presence: true
end
