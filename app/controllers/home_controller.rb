class HomeController < ApplicationController

  before_filter :restrict_access

  def index
    
  end

  def restrict_access
    if current_user
      @current_main_event = MainEvent.where(user_id: session[:user_id]).first
      redirect_to main_event_path(@current_main_event)
    end
  end

end
