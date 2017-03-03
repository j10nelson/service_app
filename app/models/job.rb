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

  # validates :title, :details, presence: true, on: :create

end
