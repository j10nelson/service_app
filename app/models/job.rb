class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :workers, source: :users

  TRADES = ['Hairdresser', 'Massage Therapist', 'Nails', 'Pool Cleaning', "Snow Removal", "House Cleaning", "Heating", "Air Conditioning"]


  # validates :title, :details, presence: true, on: :create

end
