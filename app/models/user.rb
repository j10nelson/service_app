class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :jobs
  has_many :services
  has_many :reviews
  has_many :reviews, through: :jobs

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :password, length: { minimum: 4 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
