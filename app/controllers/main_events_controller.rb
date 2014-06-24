class MainEventsController < ApplicationController
    
  def show
    @main_event = MainEvent.find(params[:id])
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
      redirect_to main_event_path(@main_event)
    else
      render :new
    end

  end

  def update
    @main_event = MainEvent.find(params[:id])
  end

  def destroy
    @main_event = MainEvent.find(params[:id])
  end


  protected

  def main_event_params
    params.require(:main_event).permit(
      :title, :image, :link, :description, :start_time, :end_time, :bride_full_name, :groom_full_name
      )
  end
end


