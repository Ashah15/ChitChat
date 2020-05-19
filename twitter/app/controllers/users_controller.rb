class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]
	before_action :correct_user, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
    	redirect_to comments_path
		else
			 render 'new'
		end
	end

	def show
		@user = current_user
		@comments = Comment.all
	end

	def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	  def user_params
    	params.require(:user).permit(:name, :username, :email)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

