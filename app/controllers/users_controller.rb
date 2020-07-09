# frozen_string_literal: true

class UsersController < ApplicationController

  @upcoming_events = @user.upcoming_events
  
  def index; end

  def create
    user = User.new
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
