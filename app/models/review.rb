class Review < ApplicationRecord
  belongs_to :job
  belongs_to :user

  def self.submitted_reviews
    where("rating IS NOT NULL")
  end

  def self.not_submitted_reviews
    where("rating IS NULL")
  end
end
