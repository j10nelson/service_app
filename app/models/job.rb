class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :worker, class_name: "User"



  def accepted?
    if self.worker_id
      return true
    else
      return false
    end
  end

  def pending?
    if self.worker_id
      return false
    else
      return true
    end
  end


  def self.accepted_jobs
    where("worker_id IS NOT NULL")
  end

  def self.pending_jobs
    where("worker_id IS NULL")
  end

  # validates :title, :details, presence: true, on: :create

end
