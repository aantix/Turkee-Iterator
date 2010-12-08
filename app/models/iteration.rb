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

  def self.create_hit(host, turkee_task, seed_data = nil)
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

  def self.returk_hit(parent_turkee_task, new_form_body)

    host = Util.host_url(parent_turkee_task.form_url)
    task = Turkee::TurkeeTask.create_hit(host, parent_turkee_task.hit_title, parent_turkee_task.hit_description, 'Iteration',
                                         parent_turkee_task.hit_num_assignments, parent_turkee_task.hit_reward, parent_turkee_task.hit_lifetime)

    # Fields that were added for the turkee_iterator demo so we update these seperatly
    task.form_body    = new_form_body
    task.allow_voting = parent_turkee_task.allow_voting
    task.returk       = parent_turkee_task.returk
    task.returk_top_x = parent_turkee_task.returk_top_x
    task.parent_id    = parent_turkee_task.id
    task.save
    task
  end

  def self.hit_complete(turkee_task)
    if turkee_task.returk?
      # Get the top X iterations by votes
      # turkee_task.internal_images.sort_by(&:position)
      iterations     = Iteration.find_all_by_turkee_task_id(turkee_task.id).sort_by(&:iteration_votes_count).reverse
      top_iterations = iterations[0..turkee_task.return_top_x - 1]

      top_iterations.each do |iteration|
        next_instructions = returk_instructions(turkee_task, iteration.value)
        returk_hit(turkee_task, next_instructions)
      end

    end
  end


  private
  def self.returk_instructions(turkee_task, value)
    # Do some sort of
    # render :inline => "<%= 'hello ' + name %>", :locals => { :entry => entry }
    #   so that you can include the text of the previously upvoted turkee_task within the instruction
    #   of the newly created task.
    #  TODO: Figure out how to render from a model.

    ActionView::Base.new.render :inline => turkee_task.returk_form_body, :locals => {:iteration => value}
  end

end
