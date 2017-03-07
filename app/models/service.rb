class Service < ApplicationRecord
  has_many :jobs
  belongs_to :user
  belongs_to :trade


  def pending_jobss
    jobs.select{|job| !job.worker}

end
end
