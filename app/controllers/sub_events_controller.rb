class SubEventsController < ApplicationController
  before_filter :restrict_access?

  def create
    @sub_event = SubEvent.new(sub_event_params)
    @sub_event.main_event_id = params[:main_event_id]
    
    if @sub_event.save 
      @main_event = MainEvent.where(user_id: session[:user_id]).first
      redirect_to main_event_path(params[:main_event_id])
    else
      render :new
    end
  end

  def new
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    @sub_event = SubEvent.new
  end

  def show
    @main_event = MainEvent.where(user_id: session[:user_id])
    @sub_event = SubEvent.find(params[:id])
    @guests = Guest.where(main_event_id: params[:main_event_id])
    @assignment = Assignment.new
  end

  def edit
    @main_event = MainEvent.where(user_id: session[:user_id]).first
    binding.pry
    @sub_event = SubEvent.find(params[:id])
  end

  def update
    @main_event = MainEvent.where(user_id: session[:user_id])
    @sub_event = SubEvent.find(params[:id])
  end

  def destroy
    @main_event = MainEvent.where(user_id: session[:user_id])
    @sub_event = SubEvent.find(params[:id])
  end

  protected

  def sub_event_params
    params.require(:sub_event).permit(
      :title, :location, :description, :date, :start_time, :end_time, :attire
      )
  end

end

