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
  end
end



rand_values = Array.new(7) { rand(1..100) }
values = [1,2,3,4,5,6,7]
tree = BinarySearchTree::Tree.new(values)

root = tree.root


p tree.delete(root, 2)
p "Find:"
tree.find(root, 6)


p "Insert"
tree.insert(root, 8)
tree.insert(root, 8)
tree.insert(root, 0)
tree.insert(root, 20)
tree.insert(root, 10)


