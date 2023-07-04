class Category < ApplicationRecord
  belongs_to :user
  has_many :labels
  has_many :operations, through: :labels
end
