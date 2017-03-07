class TradesController < ApplicationController

  def new
  @trade = Trade.new
  end


  def create
    @trade = Trade.new(trade_params)
    @trade.user = current_user

    if @trade.save
      redirect_to current_user
      # redirect_to current_user_url
    else
      render :new
    end
  end

  def trade_params
    params.require(:trade).permit(:name)
  end

end
