class Admins::OrdersController < Admins::BaseController
  
  def index
    @orders = Order.page(params[:page]).per(10)
  end
  
end
