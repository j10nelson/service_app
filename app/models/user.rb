class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :jobs, -> { order('updated_at DESC').uniq }

  # has_one :worker :source :user
  has_many :services, through: :trade
  has_many :reviews
  has_many :reviews, through: :jobs
  belongs_to :trade

  validates :first_name, :last_name, :email, presence: true, on: :create
  validates :password, length: { minimum: 4 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  # ROLES = ["client", "worker", "admin"]

  attr_accessor :house_number, :apt_number, :street, :province, :country, :postal_code, :city

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


  def worker?
    if self.role == "worker"
      return true
    else
      return false
    end
  end

end
