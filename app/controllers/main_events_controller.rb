class MainEventsController < ApplicationController

  before_filter :restrict_main_access?, :except => [:create, :new, :update]

  def show
    #scope main event by current user
    @main_event = MainEvent.find(params[:id])
    # remove and create soonest scope on the subevents model
    @sub_events = SubEvent.where(main_event_id: params[:id]).order(:date).order(:start_time)

    @true_counts = Hash.new(0)
    @false_counts = Hash.new(0)
    @nil_counts = Hash.new(0)
    
    @sub_events.each do |sub_event|
      sub_event.assignments.each do |assignment|
        if assignment.rsvp == "true"
          @true_counts[sub_event.id] += 1
        elsif assignment.rsvp == "false"
          @false_counts[sub_event.id] += 1
        elsif assignment.rsvp == "no_response"
          @nil_counts[sub_event.id] += 1
        end
      end
    end
  end
  
  def new 
    @main_event = MainEvent.new
  end
  
  def edit
    @main_event = MainEvent.find(params[:id])
  end

  def create
    @main_event = MainEvent.new(main_event_params)
    @main_event.user_id = session[:user_id]
    # @main_event = current_user.events.build(main_event_params)
    if @main_event.save
      redirect_to main_event_path(@main_event.id)
    else
      render :new
    end
  end

  def update
    # scope by current_user
    @main_event = MainEvent.find(params[:id])
    if @main_event.update_attributes(main_event_params)
      redirect_to main_event_path(@main_event)
    else
      render :edit
    end
  end

  def destroy
    @main_event = MainEvent.find(params[:id])
  end


  protected

  def main_event_params
    params.require(:main_event).permit(
      :title, :image, :link, :description, :start_time, :end_time, :bride_full_name, :groom_full_name, :date
      )
  end
end


