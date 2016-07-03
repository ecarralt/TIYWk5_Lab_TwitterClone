class UsersController < ApplicationController


  def index

    @users = User.where("id != ? ", @current_user.id)

  end

  def new
    @user = User.new
  end

  def create
    @newuser = User.new
    @newuser.first_name = params[:user][:first_name]
    @newuser.last_name = params[:user][:last_name]
    @newuser.username = params[:user][:username]
    @newuser.password = params[:user][:password]
    @newuser.password_confirmation = params[:user][:password_confirmation]

    puts @newuser.inspect

    if @newuser.save
      session[:username] = @newuser.username
      redirect_to home_path, notice: "Start sharing your thoughts!"
    else
      redirect_to welcome_path, notice: "Please fill out your full name, username, and password"
    end

  end

  def follow
  end

  def unfollow
  end

end
