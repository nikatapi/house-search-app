class HousesController < ApplicationController
	before_action :signed_in_user
  before_action :correct_user, only: :destroy

	def new
  	@house = House.new
  end

  def index
  end

  def show
    @house = House.find(params[:id])
    @hash = Gmaps4rails.build_markers(@house) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow house.price
    end
  end

	def create
    @house = current_user.houses.build(house_params)
    if @house.save
      flash[:success] = "House added to your catalog!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
	end

	def destroy
    @house.destroy
    redirect_to root_url
	end

  private
    def house_params
      params.require(:house).permit(:description, :address, :country, :city, :price)
    end

    def correct_user
      @house = current_user.houses.find_by(id: params[:id])
      redirect_to root_url if @house.nil?
    end

    
end
