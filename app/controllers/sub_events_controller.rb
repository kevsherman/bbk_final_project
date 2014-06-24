class SubEventsController < ApplicationController
  
  def create
    @sub_event = SubEvent.new(sub_event_params)

    if @sub_event.save
      @main_event = MainEvent.find(session[:user_id])
      redirect_to main_event_path(@main_event)
    else
      render :new
    end
  end

  def new
    @main_event = MainEvent.find(session[:user_id])
    @sub_event = SubEvent.new
  end

  def show
    @main_event = MainEvent.find(session[:user_id])
    @sub_event = SubEvent.find(params[:main_event_id])
  end

  def edit
    @main_event = MainEvent.find(session[:user_id])
    @sub_event = SubEvent.find(params[:id])
  end

  def update
    @sub_event = SubEvent.find(params[:id])
  end

  def destroy
    @sub_event = SubEvent.find(params[:id])
  end

  protected

  def sub_event_params
    params.require(:sub_event).permit(
      :title, :location, :description, :start_time, :end_time, :attire
      )
  end

end

