class SessionsController < ApplicationController
	def new
	end

	def create
  	user = User.find_by(username: params[:session][:username])
    if user
    	log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    	redirect_to comments_path
    else
      render 'new' 
    end

  end

  def destroy
  	log_out if logged_in?
  	redirect_to login_path
  end
end

