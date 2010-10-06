class Iteration < ActiveRecord::Base
  belongs_to :turkee_task, :class_name => 'Turkee::TurkeeTask'
  has_many :iteration_votes

  def approve?
    (!value.blank? && !turk_task_id.blank)
  end

end
