class AssignmentsController < ApplicationController
  def new
    @main_event = MainEvent.where(user_id: session[:id])
    @sub_event = SubEvent.find(params[:sub_event_id])
    
    @assignment = Assignment.new
  end

  def create
    @guest_ids = params[:assignment][:guest_id]
    @guest_ids.each do |g_id|
      new_assignment = Assignment.new(guest_id: g_id, sub_event_id: params[:sub_event_id])
      if new_assignment.guest_id
        new_assignment.save
      end
    end
    redirect_to :back
  end

  
end
