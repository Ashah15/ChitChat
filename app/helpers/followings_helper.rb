module FollowingsHelper
  def follow_id(user)
    @follow_id = current_user.followings.find_by(follower_id: user.id)
    @follow_id
  end
end
