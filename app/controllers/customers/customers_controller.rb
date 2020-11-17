class CustomersController < ApplicationController
  
  def show
  end

  def edit
  end
  
  def update
  end

  def withdrawal
  end
  
  def change
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_numbar)
  end
  
end
