class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_navbar
      @conditions = true
  end
  
  def current_user
      @current_user ||= Lecturer.find_by(lec_id: session[:id])
  end
end
