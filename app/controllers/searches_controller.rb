class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.new(search_params)
		if @search.save
			redirect_to @search
		else
			render 'new'
		end
	end

	def show
		@search = Search.find(params[:id])
		@hash = Gmaps4rails.build_markers(@search.found_houses) do |house, marker|
      		marker.lat house.latitude
      		marker.lng house.longitude
      		marker.infowindow house.price
		end
	end


private

	def search_params
		params.require(:search).permit(:country, :address, :city, :max_price, :max_radius, :desired_price)
	end
end
