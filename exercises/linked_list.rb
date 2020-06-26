class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)

    if !head
      @head = @tail = node
    else
      @tail.next_node = node
      @tail = node
    end

    @size += 1
  end

  def prepend(value)
    node = Node.new(value)

    if !head
      @list = @head = @tail = node
    else
      node.next_node = head
      @head = node
    end

    @size += 1
  end

  def at(index)
    return "Can't search list. No head node exists." if !head
    return "List isn't long enough." if index > size
    return tail if index + 1 == size

    current_node = head

    index.times do
      current_node = current_node.next_node
    end

    current_node
  end

  def pop
    return "Can't pop. No head node exists." if !head

    current_node = head
    prev_node = nil

    while current_node.next_node do
      prev_node = current_node
      current_node = current_node.next_node
    end

    prev_node.next_node = nil
    @tail = prev_node
    @size -= 1
    current_node
  end

  def find(value)
    return "Can't find value. No head node exists." if !head

    current_node = head

    while current_node do
      return current_node if current_node.value == value
      current_node = current_node.next_node
    end

    return false
  end

  def contains?(value)
    find(value) ? true : false
  end

  def insert_at(value, index)
    return "Can't insert node. No head exists." if !head
    return "List isn't long enough." if index > size
    return prepend(value) if index == 0
    return append(value) if index + 1 == size

    node = Node.new(value)

    current_node = at(index)
    prev_node = at(index - 1)

    prev_node.next_node = node
    node.next_node = current_node
    @size += 1
  end

  def remove_at(index)
    return "Can't remove node. No head exists." if !head
    return "List isn't long enough." if index >= size


    head.next_node = nil if index == 0

    prev_node = at(index - 1)
    next_node = at(index + 1)

    next_node = nil if !next_node

    prev_node.next_node = next_node
    @size -= 1
  end

  def to_str
   p head
  end
end

linked_list = LinkedList.new

linked_list.append(666)
p linked_list.size
p linked_list.head
p linked_list.tail
p linked_list.head

linked_list.append(123)
p linked_list.head

linked_list.prepend(999)
p linked_list.head
p linked_list.size
p linked_list.at(1)
p linked_list.pop() # => 123
p linked_list.head

p linked_list.contains?(123)
p linked_list.find(999)

linked_list.append(42)
linked_list.to_str

linked_list.prepend('hello world')
linked_list.to_str

linked_list.insert_at('inserted at 0', 0)
linked_list.to_str
p linked_list.size

linked_list.insert_at('insert another one', 4)
linked_list.to_str

linked_list.insert_at('middle at index 3', 3)
linked_list.to_str

linked_list.remove_at(3)
linked_list.to_str
p linked_list.size

linked_list.remove_at(5)
linked_list.to_str




