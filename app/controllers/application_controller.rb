class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user  
    
  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end
  
  def login_required
    if !current_user
      session[:redirect] = request.url
      redirect_to(root_path, :notice => "You must be logged in.")
    end
  end  
  
end
