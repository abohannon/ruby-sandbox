class Knight
  attr_reader :possible_coords, :current_coords

  def initialize(current_coords)
    @current_coords = current_coords
    @possible_coords = calculate_possible_coords
  end

  def calculate_possible_coords
    return if @current_coords.nil? || @current_coords.any?{ |coord| coord > 7}

    potential_coords = [
      [2,1],
      [1,2],
      [-2,-1],
      [-1,-2],
      [-2,1],
      [-1, 2],
      [2,-1],
      [1,-2]
    ]

    potential_coords.reduce([]) do |acc, coords|
      new_coords = coords.map.with_index do |coord, index|
        coord + current_coords[index]
      end

      new_coords.any?(&:negative?) ? acc : acc + [new_coords]
    end
  end
end
