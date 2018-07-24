=begin
mergesort memoization (top down)
time complexity: O(nlogn) worst O(nlogn)
space complexity: O(n)

=end
def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    puts result
    if left[0] <= right[0]
      result.push left.slice!(0)
    else
      result.push right.slice!(0)
    end
  end

  result += left
  result += right
  result
end

def mergesort(array)
  if array.length <= 1
    return array
  end

  left = mergesort(array[0..(array.length - 1) / 2])
  right = mergesort(array[(array.length - 1) / 2 + 1..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    puts result
    if left[0] <= right[0]
      result.push left.slice!(0)
    else
      result.push right.slice!(0)
    end
  end

  result += left
  result += right
  result
end

def mergesort(array)
  if array.length <= 1
    return array
  end

  left = mergesort(array[0..(array.length - 1) / 2])
  right = mergesort(array[(array.length - 1) / 2 + 1..-1])
  merge(left, right)
end
