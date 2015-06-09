class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  private

  def authenticate_user
    unless session[:user_id].present? && current_user.present?
      flash[:alert] = "Sorry, gotta be logged in to do that"
      redirect_to login_path
    end
  end

end
