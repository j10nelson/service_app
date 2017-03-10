class TradesController < ApplicationController

  def index
    #@services = Service.all
    @trade = Trade.all
  end
  
  def new
  @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)

    if @trade.save
       flash[:notice] = "New Trade Created!"
      redirect_to current_user
    else
      flash.now[:error] = 'Sorry, try again!'
        redirect_to root_path
    end
  end

  def trade_params
    params.require(:trade).permit(:name)
  end

end
