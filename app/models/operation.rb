class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :labels
  has_many :categories, through: :labels
  validates :name, presence: true
  validates :amount, presence: true
end
