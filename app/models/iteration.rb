class Iteration < ActiveRecord::Base
  belongs_to :turkee_task, :class_name => 'Turkee::TurkeeTask'
  has_many :iteration_votes

  accepts_nested_attributes_for :iteration_votes
end
