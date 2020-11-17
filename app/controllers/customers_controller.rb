class CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
      if @customer.save
        redirect_to customer_path
      else
        render action: :edit
      end
  end

  def withdrawal
  end

  def change
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
