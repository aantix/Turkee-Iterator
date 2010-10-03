class IterationsController < ApplicationController

  def new
    @iterations = Iteration.all
    @iteration  = Iteration.new
  end

  def index
    raise 'Must provide a turkee_task id to list the relevant results.' if params[:turkee_task_id].nil?
    get_results
  end

  def show_results
    get_results

    update_page do |page|
      page.show('spinner')
      page.render :partial => 'results'
      page.hide('spinner')
    end

  end

  private
  def get_results
    turkee_task = Turkee::TurkeeTask.find(params[:turkee_task_id])
    Turkee::TurkeeTask.process_hits(turkee_task)
    @iterations = Iteration.find_by_turkee_task_id(turkee_task_id.id)
  end

end
