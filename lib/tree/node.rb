# Node for tree
class Node
  attr_accessor :key, :left, :right, :height, :quantity

  def initialize(key)
    @key = key
    @height = 1
    @quantity = 1
    @right = nil
    @left = nil
  end
end
