class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :worker, class_name: "User"
  has_many :reviews

  validates :date, :time, presence: true, on: :create
  validates :note, length: { maximum: 255 }, presence: true, on: :create

  # make one change:
  # pass in the current_user as a piece of data to this method

  def job_pending?
    self.state == "pending"
  end

  def job_accepted?
    self.state == "accepted"
  end

  def job_completed?
    self.state == "completed"
  end

  def history?
    self.state == "history"
  end


  def job_completd_client?
    self.state == "completed" && self.reviews.size == 1
  end


  def accepted?
    self.worker_id && self.reviews.size == 0
  end


  def completed?
    if self.reviews.user_id
      true
    else
      false
    end
  end

  def pending?
  if self.worker_id
    true
  else
    false
  end
end


  def worker_done?
    self.reviews.each do |review|
      if review.user == self.user
        return true
      end
    end
    return false
  end

  def client_done?
    self.reviews.each do |review|
      if review.worker_id == self.worker_id
        return true
      end
    end
    return false
  end

  def text_message
    self.service.trade.users.map(&:phone_number)
  end

  # we hope that poop_id is the current user's id, but it's up to whoever calls this to do the right thing
  #accepted for worker
  # def self.accepted_jobs(poop_id)
  #   where("worker_id IS NOT NULL AND worker_id = #{poop_id}")
  # end

  def self.accepted_jobs_client(poop)
    where("worker_id IS NOT NULL AND user_id = #{poop}")
  end

  def self.pending_jobs_client(wtv)
    where("worker_id IS NULL AND user_id = #{wtv}")
  end


  def self.completed_jobs_client(wtv)
    where("state IS completed AND user_id = #{wtv}")
  end



  # def self.pending_jobs_worker(s)
  #   where("worker_id IS NULL")
  #   # current_user.trade.services.first.jobs.where("worker_id IS NULL AND user_id = ?", current_user.id)
  # end

# def client_info
#   if current_user == role.worker
#
# end

  # validates :title, :details, presence: true, on: :create

end


# in the controller:
# Job.accepted_jobs( current_user.id )
