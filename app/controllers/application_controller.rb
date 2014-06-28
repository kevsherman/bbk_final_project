require 'date'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :formatted_date, :logged_in?, :restrict_access?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if current_user
      @current_main_event = MainEvent.where(user_id: session[:user_id]).first
      redirect_to main_event_path(@current_main_event)
    end
  end

  def restrict_main_access?
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    if @main_event.id.to_s != params[:id]  
      flash[:notice] = "You must be update your password before continuing"
      redirect_to main_event_path(@main_event) 
    end
  end

  def restrict_access?
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    if @main_event.id.to_s != params[:main_event_id]  
      flash[:notice] = "You must be update your password before continuing"
      redirect_to main_event_path(@main_event) 
    end
  end
  
end
