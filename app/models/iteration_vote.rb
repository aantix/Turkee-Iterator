class IterationVote < ActiveRecord::Base
  belongs_to :iteration

  def approve?
    (!iteration_id.blank?)
  end

end
