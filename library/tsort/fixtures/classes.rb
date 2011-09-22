require 'tsort'

class TSortHash < Hash # :nodoc:
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

class TSortArray < Array # :nodoc:
  include TSort
  alias tsort_each_node each_index
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end
