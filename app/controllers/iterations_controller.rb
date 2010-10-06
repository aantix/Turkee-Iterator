class IterationsController < ApplicationController

  # Iteration form that allows the Turkers to either vote for a submission or create their own.
  def new
    @assignment_id = params[:assignmentId]
    @disabled      = Turkee::TurkeeFormHelper::disable_form_fields?(@assignment_id)
    params[:id]    ||= Turkee::TurkeeTask.find_by_hit_id(params[:hitId]).id rescue nil

    get_results
    @iteration  = Iteration.new
  end

  # Shows results for a given HIT.  Must pass in :id of associated TurkeeTask.
  def index
    get_results
  end

  # Function that retrieves updated results from Mechanical Turk servers and returns the data
  #  to be listed on the index page.
  def results
    get_results(true)

    render :update do |page|
      page.show('spinner')
      page.replace_html 'results', :partial => (params[:partial] || 'results')
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
