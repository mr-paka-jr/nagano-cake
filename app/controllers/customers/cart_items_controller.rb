class Customers::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @current_cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: @cart_item.customer_id)
    if @cart_item.save
      redirect_to "/customers/cart_items", notice: "商品が追加されました"
    else
      redirect_to "/customers/cart_items", notice: "商品を追加できませんでした"
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
    redirect_to "/customers/cart_items", notice: "商品が削除されました"
  end

  def all_destroy
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to "/customers/cart_items", notice: "カートが空になりました"
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end
end