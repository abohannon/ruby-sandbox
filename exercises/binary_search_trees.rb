module BinarySearchTree
  class Node
    include Comparable

    attr_accessor :value, :left, :right

    def initialize(value = nil)
      @value = value
      @left = nil
      @right = nil
    end

    def <=>(other)
      value <=> other.value
    end
  end

  class Tree
    attr_reader :root, :values

    def initialize(values = [])
      @values = values.sort.uniq
      @root = build_tree(@values, 0, @values.length-1)
    end

    def build_tree(values, left, right)
      return nil if (left > right)

      midpoint = left + (right - left) / 2

      node = Node.new(values[midpoint])

      node.left = build_tree(values, left, midpoint-1)
      node.right = build_tree(values, midpoint+1, right)

      node
    end

    def insert(node, value)
      if (value > node.value)
        if (node.right)
          insert(node.right, value)
        else
          node.right = Node.new(value)
        end
      else
        if (node.left)
          insert(node.left, value)
        else
          node.left = Node.new(value)
        end
      end
    end

    def min_value_node(node)
      current = node

      while current.left do
        current = current.left
      end

      current
    end

    def delete(node, value)
      return nil if !node

      # Handle deletion of leaf nodes
      if value < node.value
        node.left = delete(node.left, value)
      elsif value > node.value
        node.right = delete(node.right, value)
      else
        # Handle deletion of root node
        if !node.left
          temp = node.right
          node = nil
          return temp
        elsif !node.right
          temp = node.left
          node = nil
          return temp
        end

        temp = min_value_node(node.right)

        node.value = temp.value

        node.right = delete(node.right, temp.value)
      end

      node
    end

    def find(node, value)
      return nil if !node
      return node if node.value == value

      if value < node.value
        find(node.left, value)
      else
        find(node.right, value)
      end
    end

    def level_order
      q = [root]
      values_arr = []

      while !q.empty? do
        current = q.shift
        values_arr << current.value
        yield(current) if block_given?
        q << current.left if current.left
        q << current.right if current.right
      end

      values_arr unless block_given?
    end

    def inorder
      return nil if !root
      stack = []
      value_arr = []
      current = root

      while !current.nil? || !stack.empty? do
        while !current.nil? do
          stack << current
          current = current.left
        end

        current = stack.pop()

        if block_given?
          yield(current)
        else
          value_arr << current.value
        end

        current = current.right
      end

      value_arr if !block_given?
    end

    def preorder
      return nil if !root
      stack = [root]
      values_arr = []

      while !stack.empty? do
        current = stack.pop()

        yield(current) if block_given?
        values_arr << current.value

        if current.right
          stack << current.right
        end

        if current.left
          stack << current.left
        end
      end

      values_arr if !block_given?
    end

    def postorder
      return nil if !root
      stack_a = [root]
      stack_b = []
      values_arr = []

      while !stack_a.empty? do
        current = stack_a.pop()
        stack_b << current
        values_arr << current.value

        if current.left
          stack_a << current.left
        end

        if current.right
          stack_a << current.right
        end
      end

      if block_given?
        while !stack_b.empty?
          yield(stack_b.pop())
        end
      end

     values_arr.reverse() unless block_given?
    end

    def depth(node)
      if !node
        return 0
      end

      left_depth = depth(node.left)
      right_depth = depth(node.right)

      return [left_depth, right_depth].max + 1
    end

    def balanced?
      left = depth(root.left)
      right = depth(root.right)
      difference = (left - right).abs()

      difference <= 1 ? true : false
    end

    def rebalance!
      p "Rebalancing tree..."
      current_values = level_order.sort.uniq
      @root = build_tree(current_values, 0, current_values.length - 1)
      p "Tree has been rebalanced: #{balanced?}"
    end
  end
end



rand_values = Array.new(15) { rand(1..100) }
# values = [1,2,3,4,5,6,7]
tree = BinarySearchTree::Tree.new(rand_values)
root = tree.root
p "Is the tree balanced? #{tree.balanced?}"
p "Tree depth is: #{tree.depth(root)}"

tree.level_order do |node|
  p "Level order current node: #{node.value}"
end

tree.preorder do |node|
  p "Preorder current node: #{node.value}"
end

tree.postorder do |node|
  p "Postorder current node: #{node.value}"
end

tree.inorder do |node|
  p "Inorder current node: #{node.value}"
end

p "Inserting nodes..."
tree.insert(root, 8)
tree.insert(root, 8)
tree.insert(root, 0)
tree.insert(root, 20)
tree.insert(root, 10)

p "Is the tree balanced? #{tree.balanced?}"

tree.rebalance!

tree.level_order do |node|
  p "Level order current node: #{node.value}"
end

tree.preorder do |node|
  p "Preorder current node: #{node.value}"
end

tree.postorder do |node|
  p "Postorder current node: #{node.value}"
end

tree.inorder do |node|
  p "Inorder current node: #{node.value}"
end



