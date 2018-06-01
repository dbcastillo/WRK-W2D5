require "byebug"
class MaxIntSet
  def initialize(max)
    @store = []
    @max = max 
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max 
    @store.push(num)

  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # p @store
    @store.shift
    @store.push([num])
    # p @store
  end

  def remove(num)
    @store.delete([num])
    @store.push([])
  end

  def include?(num)
    @store.include?([num])    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    unless @store.include?([num])
      @count += 1
      if @count > num_buckets
        resize!
      end
      @store.shift
      @store.push([num]) 
    end
  end

  def remove(num)
    if include?(num)
      @store.delete([num])
      @store.push([])
      @count -= 1
    end
  end

  def include?(num)
    self[num]
    
  end

  private

  def [](num)

    @store[num % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(num_buckets) {[]}
    @store = new_buckets.concat(@store)
  end
end
