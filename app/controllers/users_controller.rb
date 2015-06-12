class UsersController < ApplicationController
	before_action :logged_in?, only: [:show]

  
  def index
		@users = User.all
		render :index
	end
	#new user form
	def new
    @user = User.new
    render :new
  end
  #create the user
  def create
    @user = User.create(user_params)
    login(@user) # <-- login the user
    redirect_to "/users/#{@user.id}" # <-- go to show
  end
  #show the new user
  #Is user logged in? If not then don't show

  def show
    @user = User.find(params[:id])
    render :show
  end

  def destroy

        @user = User.find(params[:id])
        @user.libraries.delete_all
        @user.destroy
        redirect_to "/users"
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end


