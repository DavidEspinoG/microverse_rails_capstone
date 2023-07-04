class User < ApplicationRecord
  has_many :operations, foreign_key: :author_id
  has_many :categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
