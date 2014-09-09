require 'will_paginate/array' 
class HousesController < ApplicationController
	before_filter :authenticate_user!
  #before_action :correct_user, only: :destroy
  
	def new
  	@house = House.new
  end

  def index
  end

  def show
    @house = House.find(params[:id])
   
    @hash = map_markers(@house)
    end

    @comments = @house.comment_threads.order('created_at desc').paginate(page: params[:page])
   
    @new_comment = Comment.build_from(@house, current_user.id, "")

  end

	def create
    @house = current_user.houses.build(house_params)
    
    if @house.save
      
      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @house.pictures.create!(image: image)
        }
      end

      flash[:success] = "House added to your catalog!"
      redirect_to root_url
    else
      render 'new'
    end
	end

	def destroy
    House.find(params[:id]).destroy
    redirect_to root_url
	end

  private
    def house_params
      params.require(:house).permit(:description, :address, :country, :city, :price, :images)
    end

    def correct_user
      @house = current_user.houses.find_by(id: params[:id])
      redirect_to root_url if @house.nil?
    end

    
end
