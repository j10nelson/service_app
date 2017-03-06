class Job < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :worker, class_name: "User"

  validates :date, :time, presence: true, on: :create
  validates :notes, length: { maximum: 255 }, presence: true, on: :create

  # make one change:
  # pass in the current_user as a piece of data to this method
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



  # we hope that poop_id is the current user's id, but it's up to whoever calls this to do the right thing
  def self.accepted_jobs(poop_id)
    where("worker_id IS NOT NULL AND worker_id = #{poop_id}")
  end

  def self.pending_jobs_client(wtv)
    where("worker_id IS NULL AND user_id = #{wtv}")
  end
  
  def self.pending_jobs_client(wtv)
    where("worker_id IS NULL AND user_id = #{wtv}")
  end

  # def self.pending_jobs_worker(wtv)
  #   where("worker_id IS NULL AND user_id = #{wtv}")
  # end

  # validates :title, :details, presence: true, on: :create

end


# in the controller:
# Job.accepted_jobs( current_user.id )
