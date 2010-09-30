class IterationsController < ApplicationController
  # GET /iterations
  # GET /iterations.xml
  def index
    @iterations = Iteration.all
    @iteration  = Iteration.new

  end

end
