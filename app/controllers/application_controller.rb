class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		sign_in_url = new_user_session_url
		if resource.team_id.blank?
			edit_user_teams_path(user_id: resource)
		elsif request.referer == sign_in_url
			super
		else
			stored_location_for(resource) || request.referer || root_path
		end
	end

	def check_team_id
		if current_user && current_user.team_id.blank?
			redirect_to edit_user_teams_path(user_id: current_user.id)
    end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :team_id, :provider, :uid])
	end

	
end
