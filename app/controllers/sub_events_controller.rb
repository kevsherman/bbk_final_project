class SubEventsController < ApplicationController
  before_filter :restrict_access?

  def create
    @sub_event = SubEvent.new(sub_event_params)
    @sub_event.main_event_id = params[:main_event_id]
    # @sub_event = current_main_event.sub_events.build(sub_event_params)
    if @sub_event.save 
      #remove
      @main_event = main_event
      # use current_main_event for id
      redirect_to main_event_path(params[:main_event_id])
    else
      render :new
    end
  end

  def new
    # use current_main_event in view
    @main_event = main_event

    @sub_event = SubEvent.new
  end

  def show
    #remove
    @main_event = main_event
    # @sub_event = current_main_event.sub_event.find(params[:id])
    @sub_event = SubEvent.find(params[:id])
    # in view current_main_event.guests
    @assignment = Assignment.new

    ### guest logic ###
    @guests = Guest.where(main_event_id: params[:main_event_id]).order(:last)
    @guestlist = @sub_event.guests.sort_by &:last

    @no_response = Assignment.where(sub_event_id: @sub_event).where(rsvp: "no_response")
    @declined = Assignment.where(sub_event_id: @sub_event).where(rsvp: "false")
    @attending = Assignment.where(sub_event_id: @sub_event).where(rsvp: "true")
  end

  def edit
    @main_event = main_event
    @sub_event = SubEvent.find(params[:id])
  end

  def update
    @main_event = main_event
    @sub_event = SubEvent.find(params[:id])
    if @sub_event.update_attributes(sub_event_params)
      redirect_to main_event_sub_event_path
    else
      render :edit
    end
  end

  def destroy
    @main_event = main_event
    @sub_event = SubEvent.find(params[:id])
    @sub_event.destroy
    redirect_to main_event_path(params[:main_event_id])
  end

  def sorted_guests(assignments)
    sorted_list = []
    assignments.each do |assignment|
      sorted_list << assignment.guest
    end
    sorted_list.sort_by &:last
  end
  helper_method :sorted_guests

  protected

  def sub_event_params
    params.require(:sub_event).permit(
      :title, :location, :description, :date, :start_time, :end_time, :attire
      )
  end

end

