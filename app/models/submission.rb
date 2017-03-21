class Submission < ApplicationRecord
  belongs_to :user

  validates :trade_requested, presence: true
  validates :deliverables_requested, presence: true
  validates :about_requested, presence: true
end
