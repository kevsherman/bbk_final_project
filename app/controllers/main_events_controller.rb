class MainEventsController < ApplicationController
    
  def show
    @main_event = MainEvent.find(params[:id])
    @sub_events = SubEvent.where(main_event_id: params[:id]).order(:date).order(:start_time)
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

    if @main_event.save
      redirect_to main_event_path(@main_event.id)
    else
      render :new
    end
  end

  def update
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


