class Admins::SearchController < Admins::BaseController

  def search
    @which_option = params[:option]
    if @which_option == "1"
      @customers = Customer.search(params[:search], @which_option).page(params[:id]).per(10)
    elsif @which_option == "2"
      @items = Item.search(params[:search], @which_option).page(params[:id]).per(10)
    end
  end

end
