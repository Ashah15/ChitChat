module UsersHelper
  def user_fan(user)
  	if current_user.fan(user)
  		follow_id(user)

  	  button_to "Unfollow",{:controller => 'followings', :action => 'destroy', :id => @follow_id },
  	  {:method => :delete, :class => "tweet-btn"}
  	else
  	  button_to "Follow",{:controller => 'followings', :action => 'create',:user_id => current_user.id, :follower_id => user.id}, {:method => :post, :class => "tweet-btn"}

  	end
  	
  end
 

end
