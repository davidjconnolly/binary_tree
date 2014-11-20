class BinaryNode

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
        self.left ? left.insert(value) : self.left = BinaryNode.new(value, self)
      when -1
        self.right ? right.insert(value) : self.right = BinaryNode.new(value, self)
      else
        false
    end
  end

  def to_a
    self.left.to_a + [self.id] + self.right.to_a
  end

end
