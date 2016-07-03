class ThoughtsController < ApplicationController

  def home
    @thought = Thought.new

    if @current_user
      @thoughts = @current_user.timeline
    else
      @thoughts = Thought.all.order("created_at DESC")
    end

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
