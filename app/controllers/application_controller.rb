class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?
  
  private
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :image_icon, :profile])
   end
   
   def configure_account_update_parameters
     devise_parameter_sanitizer.permit(:account_update, keys:[:name, :image_icon, :profile])
   end
end
