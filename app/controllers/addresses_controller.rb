class AddressesController < ApplicationController

  def new
    @user = current_user
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @user = current_user
    @address = Address.new
    @address.user_id = current_user.id

    if @address.save!

      redirect_to current_user
      # redirect_to current_user_url
    else
      render :new
    end

  end

  def edit

  end



  private
  def address_params
    params.require(:address).permit(:house_number, :street, :apt_number, :city, :province, :postal_code, :country, :user_id)
  end

end
