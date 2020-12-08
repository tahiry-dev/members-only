class User < ApplicationRecord
  validates :name, presence: true
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
