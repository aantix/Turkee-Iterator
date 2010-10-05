class IterationsController < ApplicationController

  def new
    params[:id] = Turkee::TurkeeTask.find_by_hit_id(params[:hitId]).id rescue nil

    get_results
    @iteration  = Iteration.new
  end

  def index
    get_results
  end

  def results
    logger.info "RESULTS!"
    get_results(true)

    render :update do |page|
      page.show('spinner')
      page.replace_html 'results', :partial => 'results'
      page.hide('spinner')
    end
  end

  private

    def get_results(process_hits = false)
      raise 'Must provide an id to list the relevant results.' if params[:id].nil?

      @turkee_task = Turkee::TurkeeTask.find(params[:id])
      Turkee::TurkeeTask.process_hits(@turkee_task) if process_hits
      @iterations = Iteration.find_all_by_turkee_task_id(@turkee_task.id)
    end

end
