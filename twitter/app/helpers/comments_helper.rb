module CommentsHelper
	 def liked?(comment_id)
    current_user.likes.exists?(comment_id: comment_id)
  end

  # Gets Like Id of a particular post liked by a current user
  def current_user_liked(comment_id)
    current_user.likes.find_by(comment_id: comment_id).id
  end
end
