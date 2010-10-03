class TurkeeTasksController < ApplicationController

  def new
    @turkee_task = Turkee::TurkeeTask.new
  end

  def create
    task = Turkee::TurkeeTask.create_hit(params[:title], params[:description], 'Iteration',
                                         params[:num_assignments], params[:reward], params[:lifetime])

    flash[:notice] = 'HIT was successfully created.'
    redirect_to iterations_path(task.id)
  end

end
