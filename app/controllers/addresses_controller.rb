class AddressesController < ApplicationController

  def new
    @user = current_user
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @user = current_user
    @address.user_id = current_user.id
    @user.phone_number = params[:phone_number][:phone_number]
    #@trade = Trade.find(params[:trade_id])

    @user.save
    if @address.save
      # flash[:trade_id] = @trade.id
      #  redirect_back(fallback_location: current_user)
      if @user.role == "client"
        redirect_to new_trade_job_path(params[:address][:trade_id])
         #redirect_to address_path( :trade_id => params[:trade_id] )
       else @user.role == "worker"
         redirect_to current_user
       end

      else
      redirect_to root_url  
    end
  end

  def edit
  end

  private
  def address_params
    params.require(:address).permit(:house_number, :street, :unit_number, :city, :province, :postal_code, :country, :user_id)
  end

end
