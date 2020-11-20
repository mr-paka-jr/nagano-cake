class ChangeShippingCostOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :shipping_cost, from: false, to: 800
  end
end
