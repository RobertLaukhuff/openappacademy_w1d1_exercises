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
    size = self.length
    results = []

    (0...size).each do |idx1|
      prepared_array = []
      (0...size).each do |idx2|
        prepared_array << all_arrays[idx2][idx1]
      end
      results << prepared_array
    end
    results
  end
end