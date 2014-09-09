require 'will_paginate/array' 

class SearchesController < ApplicationController

	def new
		@search = Search.new
		@houses = House.where(country: "GR")
		@hash = map_markers(@houses)
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
		@hash = map_markers(@found_houses)
	end


private

	def search_params
		params.require(:search).permit(:country, :address, :city, :max_price, :max_radius, :desired_price)
	end
end
