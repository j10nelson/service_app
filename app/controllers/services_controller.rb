class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
       flash[:notice] = "New Trade Created!"
      redirect_to current_user
    else
      flash.now[:error] = 'Sorry, try again!'
        redirect_to root_path
    end
  end




  private
  def service_params
  params.require(:service).permit(:type_of_service, :trade, :price)
  end

end
