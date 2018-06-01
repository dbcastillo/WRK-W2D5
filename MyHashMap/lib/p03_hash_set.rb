class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      @count += 1
      if count > num_buckets
        resize!
      end
      @store.shift
      @store.push([key]) 
    end
  end

  def include?(key)
    @store.include?([key])
  end

  def remove(key)
    if include?(key)
      @count -= 1
      @store.delete([key])
      @store.unshift([])
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    empty_buckets = Array.new(num_buckets) {[]}
    @store = empty_buckets += @store
  end
end
