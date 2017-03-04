class Review < ApplicationRecord
  belongs_to :job
  belongs_to :user

  def submitted?
    if self.user_id
      return true
    else
      return false
    end
  end

  def not_submitted?
    if self.user_id
      return false
    else
      return true
    end
  end

end
