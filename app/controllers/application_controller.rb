class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		sign_in_url = new_user_session_url
		if request.referer == sign_in_url
			super
		else
			stored_location_for(resource) || request.referer || articles_path
		end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :team_id) }
	end

	# ****** test *******
end
