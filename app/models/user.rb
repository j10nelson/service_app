class User < ApplicationRecord
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
