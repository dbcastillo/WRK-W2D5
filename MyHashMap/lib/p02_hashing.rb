class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    each do |num|
      if num % 2 == 0 
       total += num.hash 
     else
       total -= num.hash
     end
    end
    return total
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
