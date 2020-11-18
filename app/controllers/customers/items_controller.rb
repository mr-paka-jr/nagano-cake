class Customers::ItemsController < ApplicationController

  def about
  end

  def top
  end

  def index
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(10)
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
	def item_params
		parmas.require(:item).permit(:image_id ,:name, :introduction, :price, :is_active)
	end
end
