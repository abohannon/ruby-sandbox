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

    def insert(value)
    end

    def find(value, node = root)
      return nil if !node

      if node.value == value
        node
      else
        find(value, node.left)
        find(value, node.right)
      end
    end
  end
end



rand_values = Array.new(7) { rand(1..100) }
values = [2, 100, 6, 87, 0, 3, 66]
tree = BinarySearchTree::Tree.new(values)

p tree.values
p tree.root

p "Find:"
p tree.find(87)

