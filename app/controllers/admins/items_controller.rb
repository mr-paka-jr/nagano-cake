class Admins::ItemsController < Admins::BaseController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active )
  end
end
