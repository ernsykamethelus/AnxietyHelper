class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize_user

  private

  def logged_in? 
    !!session[:user_id]
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

    def require_user
        redirect_to login_path if !logged_in?
    end

    def redirect_to_if_not_required
      require_user
      if !authorize_user(params[:id])
        redirect_to "/"
    end 
  end

  def authorize_user(id)
    current_user.id == id.to_i
  end
  
 end




