# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:login_errors] = ['Invalid credentials']
      redirect_to '/'
    end
  end

  private

  def login_params
    params.require(:login).permit(:email)
  end
end
