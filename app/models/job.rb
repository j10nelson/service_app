class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user


  validates :title, :details, presence: true, on: :create

end
