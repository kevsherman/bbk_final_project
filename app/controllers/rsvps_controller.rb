class RsvpsController < ApplicationController

  def index
    @sub_events = SubEvent.where(main_event_id: params[:main_event_id])
    @main_event = MainEvent.find(params[:main_event_id])
  end

  def create
    @guests = Guest.where(main_event_id: params[:main_event_id])
    @main_event = MainEvent.find(params[:main_event_id])
    # current_main_event.guests.assigned.each
    # assigned with a scope on the guests model
    @guests.each do |guest|
      UserMailer.invite_guests(guest, @main_event).deliver
    end
    @main_event.update(rsvp_sent: true)
    redirect_to main_event_path(@main_event)
  end

end
