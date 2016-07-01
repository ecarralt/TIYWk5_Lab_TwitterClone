class UsersController < ApplicationController

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
      redirect_to home_path, notice: "Welcome to Thinker!"
    else
      redirect_to welcome_path, notice: "Please fill out your full name, username, and password"
    end

  end

end
