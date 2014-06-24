class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @main_event = MainEvent.where(user_id: @user.id)
        redirect_to main_event_path(@main_event)
      else
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Logged Out!"
  end

end
