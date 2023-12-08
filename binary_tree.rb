class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end
  
   def print_tree
    in_order_traversal(@root)
  end

  def in_order_traversal(node)
    return if node.nil?

    in_order_traversal(node.left)
    puts node.value
    in_order_traversal(node.right)
  end

  def insert(value)
    @root = insert_recursive(@root, value)
  end

  def search(value)
    search_recursive(@root, value)
  end

  private

  def insert_recursive(node, value)
    return TreeNode.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursive(node.left, value)
    elsif value > node.value
      node.right = insert_recursive(node.right, value)
    end

    node
  end

  def search_recursive(node, value)
    return nil if node.nil? || node.value == value

    if value < node.value
      search_recursive(node.left, value)
    else
      search_recursive(node.right, value)
    end
  end
end

tree = BinaryTree.new
tree.insert(5)
tree.insert(3)
tree.insert(8)
tree.insert(1)
tree.insert(4)
tree.insert(7)
tree.insert(9)

tree.print_tree
