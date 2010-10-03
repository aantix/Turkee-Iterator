class Iteration < ActiveRecord::Base
  belongs_to :turkee_task, :class_name => 'Turkee::TurkeeTask'
  has_many :iteration_votes, :order => 'iteration_vote_count desc'
end
