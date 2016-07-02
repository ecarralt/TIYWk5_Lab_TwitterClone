class ThoughtsController < ApplicationController

  def home
    @thought = Thought.new
    @thoughts = Thought.all

  end

end
