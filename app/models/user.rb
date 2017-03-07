class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :jobs  # requested client_jobs

  # has_one :worker :source :user
  has_many :services
  has_many :reviews
  has_many :reviews, through: :jobs
  belongs_to :trade

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :password, length: { minimum: 4 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  # ROLES = ["client", "worker", "admin"]


  def home_address?
    if self.home_address
      return false
    else
      return true
    end
  end

  def filled_home_address?
    if self.home_address
      return true
    else
      return false
    end
  end


end
