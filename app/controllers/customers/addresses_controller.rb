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
    
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
  end

  private

	def address_params
	  params.require(:address).permit(:name, :address, :postal_code)
	end

end
