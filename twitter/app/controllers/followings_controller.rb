class FollowingsController < ApplicationController
	before_action :logged_in_user

  def create
    @following = Following.new(followings_params)
    @following.save
    redirect_back(fallback_location: root_path)
  end


  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def followings_params
    params.permit(:follower_id, :user_id)
  end

end

