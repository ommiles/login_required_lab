class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    unless session[:name]
      flash[:error] = "You must be logged in to access this section"
      redirect_to controller: 'sessions', action: 'new' # halts request cycle
    end
  end

  def current_user
    session[:name]
  end

  private
  
  def require_logged_in
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to controller: 'sessions', action: 'new' # halts request cycle
    end
  end
end
