class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_index do |idx|
      if idx % 2 == 0 
       total += self[idx].hash 
     else
       total -= self[idx].hash 
     end
    end
    return total
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    array = self.values.map(&:ord)
    p array.each do
      
    end
    
  end
end
