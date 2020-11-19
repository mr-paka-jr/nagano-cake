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
  end
  
  def create
  end 
  
  def thanks
  end
  
  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
  end

end
