class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :jobs
  belongs_to :trade
  has_many :reviews
  has_many :reviews, through :jobs

validates :password, length: { minimum: 4 }, on: :create
validates :password, confirmation: true, on: :create
validates :password_confirmation, presence: true, on: :create

validates :email, uniqueness: true
end
