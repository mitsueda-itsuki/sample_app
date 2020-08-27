class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      # GET "/users/#{@user.id}"
      redirect_to @user
      # redirect_to user_path(@user)
      # redirect_to user_path(@user.id)
      # redirect_to user_path(1)
      #             => /users/1
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :passwordconfirmation)
    end
end
