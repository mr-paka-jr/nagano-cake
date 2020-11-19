class Admins::OrdersController < Admins::BaseController

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admins/customers" && path[:action] == "top"
      @orders = Order.where(created_at: Date.today).page(params[:page]).per(10)
    elsif path[:controller] == "admins/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id]).page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
end
