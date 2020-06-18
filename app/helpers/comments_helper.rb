# frozen_string_literal: true

module CommentsHelper
  def liked?(comment_id)
    current_user.likes.exists?(comment_id: comment_id)
  end

  # Gets Like Id of a particular post liked by a current user
  def current_user_liked(comment_id)
    current_user.likes.find_by(comment_id: comment_id).id
  end

  def comment_image(image)
    image_tag image, class: 'post-pic' if image.attached?
  end

  def liked(is_liked, current_user_id, comment_id)
    if is_liked
      button_to 'Unlike', { action: 'destroy', controller: 'likes', id: current_user_liked(comment_id) },
                { method: :delete, class: 'likebtn' }
    else
      button_to 'Like', { controller: 'likes', action: 'create', user_id: current_user_id, opinion_id: comment_id },
                { method: :post, class: 'likebtn' }
    end
  end
end
