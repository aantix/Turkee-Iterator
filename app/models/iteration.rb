class Iteration < ActiveRecord::Base
  has_many :iteration_votes, :order => 'iteration_vote_count desc'
end
