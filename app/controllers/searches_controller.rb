require 'will_paginate/array' 
class SearchesController < ApplicationController
	def new
		@search = Search.new
		@houses = House.where(country: "GR")
		@hash = Gmaps4rails.build_markers(@houses) do |house, marker|
      		marker.lat house.latitude
      		marker.lng house.longitude
      		marker.infowindow house.price
		end
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
		
		@found_houses = @search.found_houses.paginate(page: params[:page])
		@hash = Gmaps4rails.build_markers(@found_houses) do |house, marker|
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
