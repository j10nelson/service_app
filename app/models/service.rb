class Service < ApplicationRecord
  has_many :jobs
  belongs_to :user
  belongs_to :trade
end
