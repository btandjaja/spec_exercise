require 'array_monkey_patch'


describe Array do

  context "#uniq" do
    it "remove duplicates from the array" do
      expect([1,2,3,3].uniq).to eq([1,2,3])
    end

    it "returns an empty array if empty array is passed in" do
      expect([].uniq).to eq([])
    end
  end

  context "#two_sum" do
    it "returns an empty array if empty array is passed in" do
      expect([].two_sum).to eq([])
    end

    it "it returns an empty array if none of the pairs sums to zero" do
      expect([1,2,3,4,5].two_sum).to eq([])
    end

    it "it returns index of the numbers that sum to zero and it's sorted" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
    end
  end


end

describe "my_transpose" do
  let (:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  let (:t_matrix) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }
  it "raise IndexError if arrays are not equal sizes" do
    expect{my_transpose([[1,2,3],[4,5],[6,7]])}.to raise_error(IndexError)
  end

  it "transposes the array" do
    expect(my_transpose(matrix)).to eq(t_matrix)
    expect(my_transpose([])).to eq([])
  end
end

describe "stock_picker" do
  let (:stock_prices) { [ 10, 12, 14, 9, 15, 7, 8, 21] }

  it "raise RuntimeError if the argument is not an array" do
    expect{ stock_picker(1) }.to raise_error(RuntimeError)
  end

  it "array of one element" do
    expect{ stock_picker([0]) }.to raise_error(ArgumentError)
  end

  it "returns index of the [buy index, sell index]" do
    expect(stock_picker(stock_prices)).to eq([5,7])
  end
end

describe Hanoi do
  # subject(:hanoi) { Hanoi.new }
  let (:game) { Hanoi.new}
  describe "#initialize" do
    it "Creates three towers" do
      expect(game.stack.size).to eq(3)
    end

    it "Sets first tower to have 1,2,3" do
      expect(game.stack[0]).to eq([1,2,3])
    end

    it "Stack is a Array class" do
      expect(game.stack.class).to eq(Array)
    end

    it "Every element of stack is a array" do
      i = 0
      while i < 3
        expect(game.stack[i].class).to eq(Array)
        i += 1
      end
    end
  end

  describe "#move" do
    it "#method calls for #valid_move?" do
      expect(game).to receive(:valid_move?)
      game.move(double, double)
    end

  end

  describe "#won" do
    let(:won) { [[nil, nil, nil],[nil, nil, nil],[1,2,3]] }
    it "something" do
      expect(game.stack).to eq(won)
    end
  end

  describe "#render" do
    it "game should be able to render" do
      expect(game).to receive(:render)
      game.render
    end
  end

end
