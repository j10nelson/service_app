class Service < ApplicationRecord
  belongs_to :trade
  has_many :jobs
end
