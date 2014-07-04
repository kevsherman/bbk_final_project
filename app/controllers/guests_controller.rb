class GuestsController < ApplicationController
  before_filter :restrict_access?
    
  def index
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @guests = @main_event.guests.sort_by &:last
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.main_event_id = params[:main_event_id]
    
    if @guest.save
      @main_event = MainEvent.where(user_id: session[:user_id]).first
      redirect_to main_event_guests_path
    else
      render :new
    end
  end

  def new
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @guest = Guest.new
    
  end

  def show
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @guest = Guest.find(params[:id])
    @assignment = Assignment.new
    @assigned_events = @guest.sub_events
    @unassigned_events = SubEvent.where.not(id: @guest.sub_event_ids).where(main_event_id: @main_event)
    # binding.pry
  end

  def edit
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @guest = Guest.find(params[:id])
  end

  def update
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      redirect_to main_event_guest_path
    else
      render :edit
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to main_event_guests_path
  end

  protected

  def guest_params
    params.require(:guest).permit(
      :email, :first, :last
    )
  end

end
