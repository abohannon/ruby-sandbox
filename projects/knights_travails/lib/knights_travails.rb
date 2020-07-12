class Knight
  attr_accessor :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
  end
end

class KnightsTravails
  attr_reader :finish
  attr_accessor :visited, :root

  def initialize
    @root = nil
    @finish = nil
    @visited = []
  end

  def knight_moves(start, finish)
    @root = Knight.new(start)
    @finish = finish
    create_path(bfs)
  end

  private

  def create_path(node)
    path = []
    current = node

    until current.nil?
      path.unshift(current.value)
      current = current.parent
    end

    path
  end

  def visited?(value)
    visited.any? { |visited| visited.value == value }
  end

  def calculate_possible_moves(current)
    return if current.value.nil? || current.value.any?{ |coord| coord > 7}

    potential_moves = [
      [2,1],
      [1,2],
      [-2,-1],
      [-1,-2],
      [-2,1],
      [-1, 2],
      [2,-1],
      [1,-2]
    ]

    potential_moves.reduce([]) do |acc, move|
      new_move = move.map.with_index do |coord, index|
        coord + current.value[index]
      end

      if new_move.any?(&:negative?) || visited?(new_move)
        acc
      else
        new_knight = Knight.new(new_move)
        new_knight.parent = current
        acc + [new_knight]
      end
    end
  end

  def bfs
    q = [root]

    until q.empty?
      current = q.shift
      visited << current

      return current if current.value == finish

      unless current.nil?
        children = calculate_possible_moves(current)

        q = q + children unless children.nil?
      end
    end
  end
end

knight_travails = KnightsTravails.new
p knight_travails.knight_moves([3,3], [3,4])

=begin
Chess Board
0,7 1,7 2,7 3,7 4,7 5,7 6,7 7,7
0,6 1,6 2,6 3,6 4,6 5,6 6,6 7,6
0,5 1,5 2,5 3,5 4,5 5,5 6,5 7,5
0,4 1,4 2,4 3,4 4,4 5,4 6,4 7,4
0,3 1,3 2,3 3,3 4,3 5,3 6,3 7,3
0,2 1,2 2,2 4,2 4,2 5,2 6,2 7,2
0,1 1,1 2,1 3,1 4,1 5,1 6,1 7,1
0,0 1,0 2,0 3,0 4,0 5,0 6,0 7,0
=end

