class TurkeeTasksController < ApplicationController

  def new
    @turkee_task = Turkee::TurkeeTask.new
  end

  def create
    turkee_task = params[:turkee_turkee_task]

    task = Turkee::TurkeeTask.create_hit(turkee_task[:hit_title], turkee_task[:hit_description], 'Iteration',
                                         turkee_task[:hit_num_assignments], turkee_task[:hit_reward], turkee_task[:hit_lifetime])

    task.form_body = turkee_task[:form_body]
    task.save

    seed_data = params[:seed][:data] rescue ''
    Iteration.create(:value => seed_data, :turkee_task_id => task.id) unless seed_data.blank?

    flash[:notice] = 'HIT was successfully created.'
    redirect_to iterations_path(:id => task.id)
  end

end
