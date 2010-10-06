class IterationVote < ActiveRecord::Base
  belongs_to :iteration

  def approve?
    (!assignment_id.blank?)
  end

end
