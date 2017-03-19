class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :photo, PhotoUploader

  has_many :jobs, -> { order('updated_at DESC').uniq }

  # has_one :worker :source :user
  has_many :services, through: :trade
  has_many :reviews
  has_many :reviews, through: :jobs
  belongs_to :trade
  has_one :address

  has_one :submission


  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :password, length: { minimum: 4 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

  # ROLES = ["client", "worker", "admin"]

  # attr_accessor :house_number, :apt_number, :street, :province, :country, :postal_code, :city

  def address?
    if self.address
      return false
    else
      return true
    end
  end

  def filled_address?
    if self.address
      return true
    else
      return false
    end
  end

  # def request_submitted?
  #   if self.submission == "submitted"
  #     return false
  #   else
  #     return true
  #   end
  # end

  # def request_granted?
  # if self.submission.request_state == "completed"
  #     return true
  #   else
  #     return false
  #    end
  # end

  def no_request?
    if self.submission == "submitted"
      return false
    else
      return true
    end
  end


  def worker?
    if self.role == "worker"
      return true
    else
      return false
    end
  end

  # def am_worker
  #   self.role = "worker"
  #
  # end

end
