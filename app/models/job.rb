class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :worker, class_name: "User"
  has_many :reviews



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

  def worker_done?
    self.reviews.each do |review|
      if review.user == self.worker
        return true
      end
    end
    return false
  end

  def client_done?
    self.reviews.each do |review|
      if review.user == self.user
        return true
      end
    end
    return false
  end

  def self.accepted_jobs
    where("worker_id IS NOT NULL")
  end

  def self.pending_jobs
    where("worker_id IS NULL")
  end

  # validates :title, :details, presence: true, on: :create

end
