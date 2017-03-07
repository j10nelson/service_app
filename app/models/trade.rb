class Trade < ApplicationRecord
has_many :services
has_many :users


  def service_pending_jobss
    services.map{|service| service.pending_jobss}
  end






end
