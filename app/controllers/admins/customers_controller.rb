class Admins::CustomersController < Admins::BaseController

  def index
    @customers = Customer.page(params[:id]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
      if @customer.save
        redirect_to admins_customer_path(@customer)
      else
        render 'edit'
      end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :address,
      :telephone_number,
      :email,
      :is_deleted)
  end

end
