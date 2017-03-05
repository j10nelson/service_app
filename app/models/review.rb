class Review < ApplicationRecord
  belongs_to :job
  belongs_to :user

  # def self.submitted_reviews
  #   where("comments IS NOT PRESENT")
  # end
  #
  # def self.not_submitted_reviews
  #   where("comments IS PRESENT")
  # end

end
