class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation,:remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end
  

  private

  def map_markers(object)
	    Gmaps4rails.build_markers(object) do |house, marker|
	          marker.lat house.latitude
	          marker.lng house.longitude
	          marker.infowindow house.price
	    end
  end
end