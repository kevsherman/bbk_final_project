class GuestsController < ApplicationController
  
  def index
    @guests = Guest.all
  end

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to main_event_path(@main_event)
    #TODO: Where to redirect to?
    else
      render :new
    end
  end

  def new
    @guest = Guest.new
  end

  def show
    @guest = Guest.find(params[:main_event_id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
  end

  def destroy
    @guest = Guest.find(params[:id])
  end

  protected

  def guest_params
    params.require(:guest).permit(
      :title, :location, :description, :start_time, :end_time, :attire
      )
  end

end
