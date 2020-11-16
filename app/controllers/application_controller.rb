class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected
    def after_sign_in_path_for(resource)
      if customer_signed_in?
        customers_items_path(resource)
      else
        admins_top_path
      end
    end

  def after_sign_out_path_for(resource)
      root_path
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
                :email, :postal_code, :addresses, :phone_number])
  end

private

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
 end
end
