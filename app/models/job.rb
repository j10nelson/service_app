class Job < ApplicationRecord
  has_many :services
  belongs_to :user
  belongs_to :worker, class_name: "User"


  # validates :title, :details, presence: true, on: :create

end
