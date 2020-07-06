require 'knights_travails'

RSpec.describe Knight do
  context "#initialize" do
    it "initializes with current_coords" do
      knight = Knight.new([1,4])
      expect(knight.current_coords).to eq([1,4])
    end

    it "initializes with a list of possible_coords based on current_coords" do
      knight = Knight.new([0,0])
      expect(knight.possible_coords).to eq([[2,1], [1,2]])
    end
  end

  context "#possible_coords" do
    it "returns nil if initial coords are out of bounds" do
      knight = Knight.new([10,0])
      expect(knight.possible_coords).to be_nil
    end
  end
end
