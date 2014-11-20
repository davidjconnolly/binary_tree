class BinaryTree

  attr_accessor :root

  def initialize(root_id)
    @root = BinaryNode.new(root_id)
  end

  def insert(value)
    @root.insert(value)
  end

  def to_a
    @root.to_a
  end

end
