class UsersController < ApplicationController


  def index

    if @current_user
      @users = User.where("id != ? ", @current_user.id)
    else
      @users = User.all
    end

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
      session[:user_id] = @newuser.id
      redirect_to home_path, notice: "Welcome, #{@newuser.first_name}! Start sharing your thoughts and follow your favorite Thinkers!"
    else
      redirect_to welcome_path, notice: "Please fill out your full name, username, and password"
    end

  end

  def follow
    targetuser = User.find_by(id: params[:user_id])
    @current_user.follow(targetuser)
    redirect_to users_path, notice: "now following #{targetuser.username}"
  end

  def unfollow
    targetuser = User.find_by(id: params[:user_id])
    @current_user.stop_following(targetuser)
    redirect_to users_path, notice: "not following #{targetuser.username} anymore"
  end

  # def following
  #   @followingusers = @current_user.following_users
  # end

end
