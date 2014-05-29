class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end


private

	def search_params
		params.require(:search).permit(:country, :address, :city, :max_price, :max_radius, :desired_price)
	end
end
