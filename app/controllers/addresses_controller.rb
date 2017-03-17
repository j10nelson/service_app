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

    @user.save
    if @address.save
      redirect_to current_user
    else
  redirect_back(fallback_location: current_user)

    end
  end

  # def edit
  #
  # end



  private
  def address_params
    params.require(:address).permit(:house_number, :street, :unit_number, :city, :province, :postal_code, :country, :user_id)
  end

end
