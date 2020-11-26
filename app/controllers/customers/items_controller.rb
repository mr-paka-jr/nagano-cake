class Customers::ItemsController < ApplicationController

  def about
  end

  def top
    @genres = Genre.where(is_active: true)
    active_items = []
    @genres.each do |genre|
      active_items << genre.items.where(is_active: true)
    end
    @items = active_items.sum
  end

  def index
    @genres = Genre.where(is_active: true)
    active_items = []
    @genres.each do |genre|
      active_items << genre.items
    end
    @active_items = active_items.sum
    if params[:genre_id]
		  @genre = Genre.find(params[:genre_id])
		  @items = @genre.items.order(created_at: :desc).where(is_active: true).page(params[:page])
    else
      @items = Item.where(is_active: true).page(params[:page])
    end
  end

  def show
    @genres = Genre.where(is_active: true)
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    if @cart_item.save
      redirect_to "/customers/cart_items", notice: "商品が追加されました"
    end
  end

  private
	def item_params
		parmas.require(:item).permit(:image_id ,:name, :introduction, :price, :is_active)
	end
end
