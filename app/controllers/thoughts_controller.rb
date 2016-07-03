class ThoughtsController < ApplicationController

  def home
    @thought = Thought.new
    @thoughts = Thought.all

  end

  def create
    thought = Thought.new
    thought.body = params[:thought][:body]
    thought.user_id = @current_user.id

    if thought.save
      redirect_to home_path
    else
      redirect_to home_path, notice: "Error, please write a thought!"
    end

  end

end
