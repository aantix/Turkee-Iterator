class TurkeeTasksController < ApplicationController

  # Creates a new TurkeeTask and posts the request to the mechanical turk server.
  def new
    @turkee_task = Turkee::TurkeeTask.new
  end

  def create
    turkee_task = params[:turkee_turkee_task]
    seed_data   = params[:seed][:data] rescue ''

    host        = Util.host_url(request.referer)
    task        = Iteration.create_hit(host, turkee_task, seed_data)

    flash[:notice] = 'HIT was successfully created.'
    redirect_to iterations_path(:id => task.id)
  end

end
