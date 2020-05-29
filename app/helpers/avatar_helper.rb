module AvatarHelper
	def user_avatar
	  if user.avatar.attached?
        image_tag user.avatar , class: "s-profile-pic", alt: "profile-picture" 
      else
        image_tag gravatar_image_url(user.email, size:40), class: 's-profile-pic'
      end	
	end

end