# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #######
  # http://snippets.dzone.com/tag/acts_as_tree
  #
  def tree_ul(acts_as_tree_set, init=true, &block)

    if acts_as_tree_set.size > 0
      ret = '<ul>'
      acts_as_tree_set.collect do |item|
        next if item.parent_id && init
        ret += '<li>'
        ret += yield item
        ret += tree_ul(item.children, false, &block) if item.children.size > 0
        ret += '</li>'
      end
      ret += '</ul>'
    end
  end
end
