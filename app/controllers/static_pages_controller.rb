class StaticPagesController < ApplicationController
  
  def home
  	if user_signed_in?
  		@house = current_user.houses
      @hash = map_markers(@house)
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
