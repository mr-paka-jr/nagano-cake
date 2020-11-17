class Customers::AddressesController < ApplicationController

  def index
    @addresses = current_customer.address
  	@address = Address.new
  end

  def create
    @address = Address.new(address_params)
	  @address.customer_id = current_customer.id
    @addresses = current_customer.address
    if @address.save
     redirect_to customers_addresses_path
    end
  end

  def destroy
   @address = Address.find(params[:id])
   @addresses = current_customer.address
	 @address.destroy
	 redirect_to customers_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
	  if @address.update(address_params)
     redirect_to customers_addresses_path
	  else
	   render "edit"
	  end
  end

  private

	def address_params
	  params.require(:address).permit(:name, :address, :postal_code)
	end

end
