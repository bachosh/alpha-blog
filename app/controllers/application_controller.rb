class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?  #  am brdzanebit es methodebi gamochndeba view ebshi
  
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]    
   #   @current_user ||=  es nishnavs  tu @current_user arsebobs mashin daabrune @current_user tu arada da mianiche mnishvneloba da ise daabrune
   # User.find(session[:user_id]) if session [:user_id]   es nishnavs tu arsebobs session [:user_id] mashin daabrunos  User.find(session[:user_id])
  end
  
  def logged_in?
    !!current_user  # !! nishnavs current_user cvladis booleanad gardaqmnas
  end
  
  def require_user
    if !logged_in? # !logged_in?  es nishnavs  logged_in? =false
      flash[:danger]='You must be logged in to perform that action'
      redirect_to root_path
    end
  end
  
  
end
