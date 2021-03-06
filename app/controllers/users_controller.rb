class UsersController < ApplicationController
  def index
    @users = User.all
    flash[:success] = "User all retrieved."
    @user = User.new
  end

  def new
    @user = User.new
    flash[:success] = "User new."
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User create."
      #UserMailer.deliver_registration_confirmation(@user)
      UserMailer.registration_confirmation(@user).deliver
      redirect_to @user
    else
      render "new"
    end 
  end

  def show
    @user = User.find(params[:id])
    flash[:success] = "User show."
  end

  def edit
    @user = User.find(params[:id])
    flash[:success] = "User edit."
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "User update."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
