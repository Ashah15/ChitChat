module ApplicationHelper
  def flash_message
  	flash.map do |key, msg|
       content_tag :div, msg, :id => key, :class => 'flash'
    end.join
  	
  end
end
