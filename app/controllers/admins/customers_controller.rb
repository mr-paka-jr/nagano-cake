class Admins::CustomersController < Admins::BaseController

  def index
    @customers = Customer.page(params[:id]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
