require "byebug"

class Array

  def my_each(&proc)
    index = 0
    while index < self.length
      proc.call(self[index])
      index += 1
    end
    self
  end

  def my_select(&proc)
    results = []
    self.my_each do |num|
      results << num if proc.call(num)
    end
    results
  end

  def my_reject(&proc)
    results = []
    self.my_each do |num|
      results << num if !proc.call(num)
    end
    results
  end

  def my_any?(&proc)
    self.my_each do |num|
      return true if proc.call(num)
    end
    false
  end

  def my_all?(&proc)
    self.my_each do |num|
      return false if !proc.call(num)
    end
    true
  end
  
  def my_flatten
    return [self] if !self.is_a?(Array)
    flattened_array = []
    self.each do |arr|
      flattened_array += arr.my_flatten
    end
    flattened_array
  end

  def my_zip(*args)
    all_arrays = [self, *args]
    size_of_self = self.length
    results = []

    (0...size_of_self).each do |idx1|
      prepared_array = []
      (0...size_of_self).each do |idx2|
        prepared_array << all_arrays[idx2][idx1]
      end
      results << prepared_array
    end
    results
  end

  def my_rotate(rotations = 1)
    rotated_array = self
    if rotations > 0
      rotations.times {rotated_array.push(rotated_array.shift)}
    else
      rotations *= -1
      rotations.times {rotated_array.unshift(rotated_array.pop)}
    end

    rotated_array
  end

  def my_join(separator = '')
    joined_string = ''
    self.each do |value|
      joined_string += value + separator
    end
    joined_string
  end

  def my_reverse
    reversed_array = []
    self.each {|value| reversed_array.unshift(value)}
    
    reversed_array
  end
end