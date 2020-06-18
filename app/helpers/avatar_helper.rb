# frozen_string_literal: true

module AvatarHelper
  def user_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar, class: 's-profile-pic', alt: 'profile-picture'
    else
      image_tag gravatar_image_url(user.email, size: 40), class: 's-profile-pic'
    end
  end

  def current_user_avatar(current_user)
    if current_user.avatar.attached?
      image_tag current_user.avatar, class: 'm-profile-pic', alt: 'profile-picture'
    else
      image_tag gravatar_image_url(current_user.email, size: 40), class: 'm-profile-pic'
    end
  end
end
