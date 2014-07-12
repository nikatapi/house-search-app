class StaticPagesController < ApplicationController
  
  def home
  	if user_signed_in?
  		@house = current_user.houses
      @hash = Gmaps4rails.build_markers(@house) do |house, marker|
        marker.lat house.latitude
        marker.lng house.longitude
        marker.infowindow house.price.to_s
      end
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
