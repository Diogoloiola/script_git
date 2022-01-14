require_relative 'node'

# Avl Tree
class AVLTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def height(node)
    if node.nil?
      0
    else
      node.height
    end
  end

  def max(value_one, value_two)
    value_one > value_two ? value_one : value_two
  end

  def right_rotate(y)
    x = y.left
    t2 = x.right

    x.right = y
    y.left = t2

    y.height = max(height(y.left),
                   height(y.right)) + 1
    x.height = max(height(x.left),
                   height(x.right)) + 1

    x
  end

  def left_rotate(x)
    y = x.right
    t2 = y.left

    y.left = x
    x.right = t2

    x.height = max(height(x.left),
                   height(x.right)) + 1
    y.height = max(height(y.left),
                   height(y.right)) + 1
    y
  end

  def get_balance(node)
    return 0 if node.nil?

    height(node.left) - height(node.right)
  end

  def insert(node, key)
    return Node.new(key) if node.nil?

    if key < node.key
      node.left = insert(node.left, key)
    elsif key > node.key
      node.right = insert(node.right, key)
    else
      node.quantity += 1
      return node
    end

    node.height =
      1 + max(height(node.left),
              height(node.right))

    balance = get_balance(node)

    return right_rotate(node) if balance > 1 && key < node.left.key

    return left_rotate(node) if balance < -1 && key > node.right.key

    if balance > 1 && key > node.left.key
      node.left = left_rotate(node.left)
      return right_rotate(node)
    end

    if balance < -1 && key < node.right.key
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    node
  end

  def pre_order(node)
    unless node.nil?
      puts "Email: #{node.key} number of commits #{node.quantity} "
      pre_order(node.left)
      pre_order(node.right)
    end
  end
end
