class Node

  attr_accessor :id, :left, :right, :parent

  def initialize(id, parent=nil, left=nil, right=nil)
    @id = id
    @parent = parent
    @left = left
    @right = right
  end

  def insert(value)
    case self.id <=> value
      when 1
        self.left ? left.insert(value) : self.left = Node.new(value, self)
      when -1
        self.right ? right.insert(value) : self.right = Node.new(value, self)
      else
        false
    end
  end

end
