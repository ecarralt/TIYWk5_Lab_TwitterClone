class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:username] = params[:username]
      redirect_to home_path, notice: "Welcome to Thinker #{user.username}!"
    else
      redirect_to welcome_path, notice: "Something is wrong with your username and/or password. Please try again, you can do it!!"
    end
  end


  def delete

    session[:username].destroy
    redirect_to welcome_path, notice: "Come back to share your thoughts!"

  end

end
