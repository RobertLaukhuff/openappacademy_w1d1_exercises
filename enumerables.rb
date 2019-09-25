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
end