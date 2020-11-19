class Customers::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
  	@addresses = Address.where(customer: current_customer)
  end

  def confirm
     @cart_items = current_customer.cart_items
     @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )
    #newページのaddressでaddressが選択されていれば
    if params[:order][:addresses] == "address"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name +
                           current_customer.first_name

    #newページのaddressでaddressesが選択されていれば
    elsif params[:order][:addresses] == "addresses"
      ship = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name

    #newページのaddressでnew_addressが選択されていれば
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
    end
  end

  def create
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
