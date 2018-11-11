class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :require_login

private
	def require_login
		flash[:error] = "Log in first"
		redirect_to login_path
	end

 	def logged_in?
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def current_user?(user)
		current_user == user
	end

	def require_admin
		unless current_user_admin?
  		redirect_to root_path, notice: "Sign in as admin required"
		end
 	end

 	def current_user_admin?
 		current_user && current_user.admin?
 	end

 	helper_method :logged_in?
	helper_method :current_user
	helper_method :current_user?
	helper_method :current_user_admin?

end
