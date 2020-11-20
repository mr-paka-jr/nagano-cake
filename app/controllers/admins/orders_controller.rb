class Admins::OrdersController < Admins::BaseController

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admins/customers" && path[:action] == "top"
      @orders = Order.where('created_at > ?', Date.today).page(params[:page]).per(10)
    elsif path[:controller] == "admins/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id]).page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    subtotal = []
    @order_details.all.each do |order_detail|
      subtotal << (order_detail.price * order_detail.amount)
    end
    @total_price = subtotal.sum
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    case order.status
    when "入金確認"
      order.order_details.update(making_status: "製作待ち")
    end
    redirect_to admins_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
