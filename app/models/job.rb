class Job < ApplicationRecord
  has_many :services
  belongs_to :user
  belongs_to :worker, class_name: "User"

  TRADES = ['Hair Dresser', 'Massage Therapist', 'Nails', 'Pool Cleaning', "Snow Removal", "House Cleaning", "Heating", "Air Conditioning"]


  # validates :title, :details, presence: true, on: :create

end
