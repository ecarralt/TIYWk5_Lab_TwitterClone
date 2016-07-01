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

    session.delete :username  # session[:username] = nil (should also work)
    redirect_to welcome_path, notice: "Thanks! Come back later to share more thoughts!"

  end

end
