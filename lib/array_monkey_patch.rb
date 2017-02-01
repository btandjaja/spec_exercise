class Array
  def two_sum
    pairs = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        pairs << [i,j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    pairs
  end

end


def my_transpose(arr)
  return arr if arr.empty?
  size = arr[0].length
  (1...arr.length).each do |idx|
    raise IndexError if size != arr[idx].length
  end
  result = []
  (0...arr.length).each do |i|
    result << []
    (0...size).each do |j|
      result[i] << arr[j][i]
    end
  end
  result
end

def stock_picker(arr)
  raise RuntimeError unless arr.is_a?(Array)
  raise ArgumentError if arr.length == 1

  buy = arr.find_index(arr.min)
  sell =-1
  (buy+1...arr.length).each do |index|
    sell = index if arr[index] > arr[buy]
  end
  result = [buy,sell]
  return "don't sell yet" if sell == -1
  [buy,sell]
end

class Hanoi
  attr_reader :stack
  def initialize
    @stack=[[1,2,3],Array.new(3),Array.new(3)]
  end

  def run
  end

  def move(starting, ending)
    valid_move?
    #only check if starting 0..2
  end

  def valid_move?
  end

  def render
    size = @stack.length - 1
    puts "    0\t\t1\t\t2"
    (0..size).each do |i|
      print "#{@stack[i]}"
      print "\t" if @stack.length - 1 == i
    end
    puts "\n"
  end

  def won?
    (0...@stack.length).each do |index|
      true unless index < @stack.length - 2 && @stack[index].empty?
    end
    false
  end
end
#
# a = Hanoi.new
# a.render
# p a.won?
