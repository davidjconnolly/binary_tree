class Tree

  DEFAULT_TREE = [50, 25, 75, 15, 30, 66, 89, 27, 37].freeze

  attr_accessor :root, :nodes

  def initialize(nodes)
    @root = Node.new(nodes.first)
    @nodes = {}
    @nodes[nodes.first] = @root

    nodes.drop(1).each do |item|
      new_node = insert(item)
      @nodes[item] = new_node if new_node
    end
  end

  def insert(value)
    @root.insert(value)
  end

  def self.lowest_common_ancestor(node1, node2)
    node1_parents = []
    node2_parents = []
    root_node = nil

    while node1
      node1_parents << node1
      node1 = node1.parent
    end

    while node2
      node2_parents << node2
      node2 = node2.parent
    end

    while (node1 == node2 && node1_parents.any? && node2_parents.any?)
      root_node = node1
      node1 = node1_parents.pop
      node2 = node2_parents.pop
    end

    (node1 == node2) ? node1 : root_node
  end

end
