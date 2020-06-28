module BinarySearchTree
  class Node
    include Comparable

    attr_accessor :left, :right
    attr_reader :value

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

    def find(value, node = root)
      return nil if !node
      return node if node.value == value

      if value < node.value
        find(value, node.left)
      else
        find(value, node.right)
      end
    end
  end
end



rand_values = Array.new(7) { rand(1..100) }
values = [1,2,3,4,5,6,7]
tree = BinarySearchTree::Tree.new(values)

root = tree.root

p "Find:"
p tree.find(6)


p "Insert"
p tree.insert(root, 8)
p tree.insert(root, 8)
p tree.insert(root, 0)
p tree.insert(root, 20)
p tree.insert(root, 10)

p root

