class ThoughtsController < ApplicationController

  def home
    @thought = Thought.new
  end

end
