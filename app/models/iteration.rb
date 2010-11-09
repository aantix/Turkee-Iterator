class Iteration < ActiveRecord::Base
  acts_as_tree :foreign_key => "parent_id"

  belongs_to :turkee_task, :class_name => 'Turkee::TurkeeTask'
  has_many :iteration_votes

  def approve?
    (!value.blank? && !turkee_task_id.blank?)
  end

  def iteration_votes_count
    iteration_votes.count
  end

  def self.create_hit(host, turkee_task, seed_data)
    task = Turkee::TurkeeTask.create_hit(host, turkee_task[:hit_title], turkee_task[:hit_description], 'Iteration',
                                         turkee_task[:hit_num_assignments], turkee_task[:hit_reward], turkee_task[:hit_lifetime])

    # Fields that were added for the turkee_iterator demo so we update these seperatly
    task.form_body    = turkee_task[:form_body]
    task.allow_voting = turkee_task[:allow_voting]
    task.returk       = turkee_task[:returk]
    task.returk_top_x = turkee_task[:returk_top_x]
    task.save

    Iteration.create(:value => seed_data, :turkee_task_id => task.id) unless seed_data.blank?
    task
  end

  def self.hit_complete(turkee_task)
    if turkee_task.returk?
      # Get the top X iterations by votes
      # turkee_task.internal_images.sort_by(&:position)
      iterations     = Iteration.find_all_by_turkee_task_id(@turkee_task.id).sort_by(&:iteration_votes_count).reverse
      top_iterations = iterations[0..turkee_task.return_top_x - 1]

      top_iterations.each do |iteration|
        parent_task = iteration.turkee_task

        host = Util.host_url(parent_task.form_url)
        task = create_hit(host, parent_task.hit_title, parent_task.hit_description, parent_task.hit_num_assignments,
                          parent_task.hit_reward, parent_task.hit_lifetime, storyline(iteration.value))

        task.parent_id = parent_task.id
        task.save
      end

      #
      # Using the same instructions from the parent task, feed in a TurkeeTask for each
      #  of the top TurkeeTasks

    end
  end


  private
  def self.storyline(entry)
    storyline = "Help me to write the next few lines of the story.<br/><br/>"
    storyline+= "Here's what just happened :<br/>"
    storyline+= entry
    storyline+= "<br/><br/>NOW, what happens next?"
  end

end
