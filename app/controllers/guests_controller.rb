class GuestsController < ApplicationController
  
  def index
    @guests = Guest.all
  end

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to guests_path
    else
      render :new
    end
  end

  def new
    @guest = Guest.new
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end

  protected

  def guest_params
    params.require(:guest).permit(
      :email, :first, :last
    )
  end

end
