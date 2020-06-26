class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :list, :size, :head, :tail

  def initialize
    @list = nil
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value, nil)
    if !head
      @list = @head = @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
  end

  def at(index)
  end

  def pop
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
    p @list.to_s
  end
end

linked_list = LinkedList.new
linked_list.append(666)
p linked_list.size
p linked_list.head
p linked_list.tail
p linked_list.list

linked_list.append(123)
p linked_list.list
