require 'date'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user, :formatted_date, :logged_in?, :restrict_access?, :rsvps_sent?, :thankyou

  def logged_in?
    if current_user && main_event
      redirect_to main_event_path(main_event)
    elsif current_user
      redirect_to new_main_event_path
    end
  end
  
  def restrict_main_access?
    if main_event.id.to_s != params[:id]  
      flash[:notice] = "You must be update your password before continuing"
      redirect_to main_event_path(main_event) 
    end
  end

  def restrict_access?
    if main_event.id.to_s != params[:main_event_id]  
      flash[:notice] = "You must be update your password before continuing"
      redirect_to main_event_path(main_event) 
    end
  end

  def main_event
    @main_event ||= current_user.main_event
  end

  def thankyou
    render '/thankyou'
  end
  
end
