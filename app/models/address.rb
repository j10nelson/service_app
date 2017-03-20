class Address < ApplicationRecord
  belongs_to :user

  #validates_associated :user, message: "Phone number can't be blank"
  validates :house_number, length: { maximum: 8 }, presence: true, on: :create
  validates :street, presence: true, on: :create
  validates :city, presence: true, on: :create
  validates :province, presence: true, on: :create
  validates :country, presence: true, on: :create
  validates :postal_code, presence: true, on: :create

end
