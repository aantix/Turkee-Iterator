class TurkeeTasksController < ApplicationController

  def new
    @turkee_task = Turkee::TurkeeTask.new
  end

  def create
    Turkee::TurkeeTask.create_hit(params[:title], params[:description], 'Iteration',
                                  params[:num_assignments], params[:reward], params[:lifetime])

    flash[:notice] = 'Auction was successfully created.'
    redirect_to request.referrer
  end

end
