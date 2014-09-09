class UsersController < ApplicationController
   before_action :correct_user,   only: [:edit, :update]
   before_filter :authenticate_user! ,only: [:edit, :update]
   before_action :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @houses = @user.houses.paginate(page: params[:page])
    @hash = map_markers(@houses)
    end
  end


  def edit
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profile updated"
  		redirect_to @user  	
    else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User deleted!"
  	redirect_to users_url
  end

  def index
  	@users = User.paginate(page: params[:page])
  end


  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  	end

  	#Before filters


  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_url) unless current_user?(@user)
  	end

  	def admin_user
  		redirect_to(root_url) unless current_user.admin?
  	end
end
