class Customers::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @current_cart_item = Cart_item.find_by(item_id: @cart_item.item_id, customer_id: @cart_item.customer_id)
    if @current_cart_item = nil?
      if @cart_item.save
        redirect_to "/customers/cart_items", notice: "商品が追加されました"
      else
        @cart_items = current_customer.carts
        render 'index'
      end
    end
  end

  def update
    @cart_item = Cart.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to "/customers/cart_items"
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to "/customers/cart_items"
  end
  
  def destroy_all
    @cart_item = current_customer.cart_item
    @cart_item.destroy_all
    redirect_to "/customers/cart_items", notice: "カートが空になりました"
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
  end
end
