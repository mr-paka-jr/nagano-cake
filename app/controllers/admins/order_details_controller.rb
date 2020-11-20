class Admins::OrderDetailsController < Admins::BaseController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order = order_detail.order
    order_details = order.order_details
    case order_detail.making_status
    when "製作中"
      order.update(status: "製作中")
    when "製作完了"
      if order_details.all? {|order_detail| order_detail.making_status == "製作完了"}
        order.update(status: "発送準備中")
      end
    end
    redirect_to admins_order_path(order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
