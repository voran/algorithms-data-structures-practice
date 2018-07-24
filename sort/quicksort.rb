=begin
quicksort (divide and conquer)
time complexity: O(nlogn) wort O(n^2)
space complexity: O(logn)

=end
def quicksort(array)
  return array if array.length <= 1
  pivot = array.sample
  left = []
  right = []
  array.each do |element|
    if element < pivot
      left << element
    else
      right << element
    end
  end
  quicksort(left) + quicksort(right)
end
