class IterationVote < ActiveRecord::Base
  belongs_to :iteration, :counter_cache => true
end
