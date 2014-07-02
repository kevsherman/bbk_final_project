class ItineraryController < ApplicationController

  def show 
    @guest = Guest.find(params[:id])
    @assignment = Assignment.new
    @main_event = MainEvent.where(id: @guest[:main_event_id]).first
  end

  def thankyou
   render '/thankyou'
  end
end
