class ItineraryController < ApplicationController

  def show 
    @guest = Guest.find(params[:id])
    @assignment = Assignment.new
    @main_event = MainEvent.where(id: @guest[:main_event_id]).first
    # binding.pry
    # @sub_event = SubEvent.where()
  end

end
