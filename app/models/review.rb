class Review < ApplicationRecord
  belongs_to :job
  belongs_to :user

  def self.client_comment(wtv)
    where ("user_id IS NULL AND job_id = #{wtv}")
  end

  def self.worker_comment(wtv)
    where ("user_id IS NOT NULL AND job_id = #{wtv}")
  end
end
