class IterationsController < ApplicationController

  def new
    params[:turkee_task_id] = Turkee::TurkeeTask.find_by_hit_id(params[:HITId]).id rescue nil

    get_results
    @iteration  = Iteration.new
  end

  def index
    get_results
  end

  def results
    get_results(true)
    update_page do |page|
      page.show('spinner')
      page.render :partial => 'results', :update => 'results'
      page.hide('spinner')
    end
  end

  private

    def get_results(process_hits = false)
      raise 'Must provide a turkee_task id to list the relevant results.' if params[:turkee_task_id].nil?

      turkee_task = Turkee::TurkeeTask.find(params[:turkee_task_id])
      Turkee::TurkeeTask.process_hits(turkee_task) if process_hits
      @iterations = Iteration.find_by_turkee_task_id(turkee_task_id.id)
    end

end
