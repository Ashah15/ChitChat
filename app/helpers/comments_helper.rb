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
      button_to 'Like', { controller: 'likes', action: 'create', user_id: current_user_id, comment_id: comment_id },
                { method: :post, class: 'likebtn' }
    end
  end

  def method_name
    content_tag(:p, "Hello world!")
  end

  def show_comments(user)
    return if user == current_user
     content = user_avatar(user)
     content << content_tag(:p, content_tag(:span, user.name, class: "f-name").concat(content_tag(:i, "", class: "fas fa-check-circle")).concat(content_tag(:span, "@#{user.username}", class: "u-name")), class: "follower-name" )
     content << show_users(user)
     content 
    #{}"#{show_users(user)} #{user_avatar(user)} #{user_fan(user)}"
      #show_users(user)
      #user_avatar(user)
      #user_fan(user)
      #<p class="follower-name"><span class="f-name"><%= user.name %></span> 
      #<i class="fas fa-check-circle"></i><br><span class="u-name">@<%= user.username %></span></p>
  end
end
