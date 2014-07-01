class AssignmentsController < ApplicationController
  def new
    #helper method in the application controller
    @main_event = MainEvent.where(user_id: session[:id])
    @sub_event = SubEvent.find(params[:sub_event_id])
    @assignment = Assignment.new
  end

  def create
    Assignment.create_for_type(params)
    redirect_to :back
  end

  def destroy
    @assignment = Assignment.where(guest_id: params[:id]).where(sub_event_id: params[:sub_event_id]).first
    # binding.pry
    # @assignment.destroy
    Assignment.destroy(@assignment)
    redirect_to :back
  end
end
