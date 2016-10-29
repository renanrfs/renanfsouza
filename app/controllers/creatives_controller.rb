class CreativesController < ApplicationController
  layout "creative"

  def index
  	begin
  		#@instagram = Instagram.user_recent_media("34135261", {:count => 1})
  		@instagram = Instagram.tag_recent_media('renanfsouza')
  	rescue Exception => e
  		puts 'Oops..'
  	end
  end

  def search_by_tag(tag_param)
  	@instagram = Instagram.user_recent_media("34135261", {:count => 200})
  	for tag in instagram.tags
  		if tag == tag_param
  			#....
  		end
  	end
  end

end
