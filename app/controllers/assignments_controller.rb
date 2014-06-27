class AssignmentsController < ApplicationController
  def new
    @main_event = MainEvent.where(user_id: session[:id])
    @sub_event = SubEvent.find(params[:sub_event_id])
    @guests = Guest.where(main_event_id: params[:main_event_id])
    @assignment = Assignment.new
  end

  def create
    
  end

  
end
